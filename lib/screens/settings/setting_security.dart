import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/settings/login_history.dart';
import 'package:asianbitcoins/screens/settings/password_reset.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
import 'package:asianbitcoins/screens/settings/setting_verification.dart';
import 'package:asianbitcoins/screens/welcome_navigation.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> fetchPost() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/setting_security.php?key=anu5781&email=' +
          email);
  if (response.statusCode == 200) {
    //  value=json.decode(response.body);
    // count++;
    // If the call to the server was successful, parse the JSON.
    Map<String, dynamic> value = json.decode(response.body);

    return value['two_fa'];

    // return  _onBasicAlertPressed(context);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class SettingSecurity extends StatefulWidget {
  static const sid = 'setting_security';

  @override
  _SettingSecurityState createState() => _SettingSecurityState();
}

class _SettingSecurityState extends State<SettingSecurity> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  bool prefvisible = false;
  String d_text;

  //checkbox values for prefrences
  Color color;
  bool selling_vacation = false;
  bool buying_vacation = false;
  bool show_me_as_real_name = false;
  bool email_content = false;
  Future<String> two_fa;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    two_fa = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<String>(
      future: two_fa,
      builder: (context, snapshot) {
        List<Widget> list = new List();
        if (snapshot.hasData) {
          if (snapshot.data == "1") {
            color = color9;
            d_text = "Disable";
          } else {
            color = color2;
            d_text = "Enable";
          }
          return Container(
            child: Scaffold(
              drawer: SideBar(),
              backgroundColor: color3,
              appBar: AppBar(
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ChatHome.sid);
                    },
                    child: ChatCount(),
                  ),
                ],
                iconTheme: IconThemeData(
                  color: color4,
                ),
                centerTitle: true,
                elevation: 0.0,
                title: Text(
                  'Settings',
                  style: text4,
                ),
              ),
              body: Container(
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, SettingProfile.sid);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text(
                                        'Profile',
                                        style: text2.copyWith(
                                          fontSize: 12.0,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color: color2,
                                          width: 2,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, PasswordReset.sid);
                                    },
                                    color: color1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text(
                                        'Security',
                                        style: text2.copyWith(
                                          fontSize: 12.0,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color: color2,
                                          width: 2,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, SettingVerification.sid);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          'Verification',
                                          style: text2.copyWith(
                                            fontSize: 12.0,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color: color2,
                                          width: 2,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

//                      Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: Column(
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.only(
//                                      top: 8, bottom: 16, left: 8, right: 8),
//                                  child: Container(
//                                    width: width * 0.5 - 16,
//                                    child: CircularPercentIndicator(
//                                      radius: 60.0,
//                                      lineWidth: 5.0,
//                                      percent: 0.3,
//                                      center: new Text("30%"),
//                                      progressColor: color9,
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Expanded(
//                            child: Column(
//                              children: <Widget>[
//                                Text(
//                                  'Security weak',
//                                  style: text10,
//                                  textAlign: TextAlign.left,
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        color: color1.withOpacity(0.5),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Password\t\t',
                                                      style: text13.copyWith(
                                                        color: color4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        PasswordReset.sid);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Text(
                                                      'Change',
                                                      style: text2.copyWith(
                                                        fontSize: 12.0,
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                      color: color2,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //single container
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Protect your account with a strong password.',
                                                style: text10,
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width - 32,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32, right: 32),
                                      child: Divider(
                                        color: color2,
                                        thickness: 2,
                                      ),
                                    ),
                                  ), //divider

                                  //for mobile no
//                                  Container(
//                                    width: width - 32,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          child: Column(
//                                            crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              RichText(
//                                                textAlign: TextAlign.left,
//                                                text: TextSpan(
//                                                  children: [
//                                                    TextSpan(
//                                                      text:
//                                                          'Two-Factor Authentication\t\t',
//                                                      style: text13.copyWith(
//                                                        color: color4,
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                        Expanded(
//                                          child: Padding(
//                                            padding: const EdgeInsets.all(0.0),
//                                            child: Column(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.stretch,
//                                              children: <Widget>[
//                                                FlatButton(
//                                                  onPressed: () {
//                                                    Navigator.pushNamed(
//                                                        context,
//                                                        TwoFactorAuthentication
//                                                            .sid,
//                                                        arguments: d_text);
//                                                  },
//                                                  child: Padding(
//                                                    padding:
//                                                        const EdgeInsets.all(
//                                                            0.0),
//                                                    child: Text(
//                                                      d_text,
//                                                      style: text2.copyWith(
//                                                        color: color,
//                                                        fontSize: 12.0,
//                                                        letterSpacing: 0,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                  shape: RoundedRectangleBorder(
//                                                    borderRadius:
//                                                        BorderRadius.circular(
//                                                            10.0),
//                                                    side: BorderSide(
//                                                      color: color,
//                                                      width: 1,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ), //single container
//                                  Container(
//                                    width: width - 32,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          child: Column(
//                                            crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Text(
//                                                'Protect your bitcoin with extra layer of security.',
//                                                style: text10,
//                                                textAlign: TextAlign.left,
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Container(
//                                    width: width - 32,
//                                    child: Padding(
//                                      padding: const EdgeInsets.only(
//                                          left: 32, right: 32),
//                                      child: Divider(
//                                        color: color2,
//                                        thickness: 2,
//                                      ),
//                                    ),
//                                  ), //divider

                                  //for real name
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Login History\t\t',
                                                      style: text13.copyWith(
                                                        color: color4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        LoginHistory.sid);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Text(
                                                      'View',
                                                      style: text2.copyWith(
                                                        fontSize: 12.0,
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                      color: color2,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //single container
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'A list of previous logins with IP addresses.',
                                                style: text10,
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width - 32,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32, right: 32),
                                      child: Divider(
                                        color: color2,
                                        thickness: 2,
                                      ),
                                    ),
                                  ), //divider

                                  //personal data
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Personal Data\t\t',
                                                      style: text13.copyWith(
                                                        color: color4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    download();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Text(
                                                      'Download',
                                                      style: text2.copyWith(
                                                        fontSize: 12.0,
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                      color: color2,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //single container
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Export your personal data in CSV files.',
                                                style: text10,
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width - 32,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32, right: 32),
                                      child: Divider(
                                        color: color2,
                                        thickness: 2,
                                      ),
                                    ),
                                  ), //divider

                                  //account delete
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'Account Deletion \t\t',
                                                      style: text13.copyWith(
                                                        color: color4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    delete();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Text(
                                                      'Delete',
                                                      style: text2.copyWith(
                                                        color: color9,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                      color: color9,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //single container
                                  Container(
                                    width: width - 32,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Take the steps to delete your account.',
                                                style: text10,
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width - 32,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32, right: 32),
                                      child: Divider(
                                        color: color2,
                                        thickness: 2,
                                      ),
                                    ),
                                  ), //divider
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //whitecard
                  ],
                ),
              ),
//
              bottomNavigationBar: Container(
                color: color1,
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BuyCoinDashboard.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Buy',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SellCoinDashboard.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sell',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PostTradeDecide.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Post',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          //return Text("Fuck You");
        }

        return Dialog(
          child: Container(
            color: Color.fromRGBO(18, 18, 18, 1),
            child: new Row(
              //     height: 10,
              mainAxisSize: MainAxisSize.max,
              children: [
                new Container(
                  height: 70,
                  margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  /*  child: ColorLoader(
                                            colors: colors,
                                            duration: Duration(milliseconds: 1200)
                                        ),*/
                ),
                new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(62, 212, 0, 1),
                  ),
                ),
                new SizedBox(
                  width: 20,
                ),
                //     new Container(margin: EdgeInsets.fromLTRB(0,0,5,0),),
                new Text(
                  "Loading",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );

        // By default, show a loading spinner.
        //     return CircularProgressIndicator();
      },
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", null);
    prefs.setString("pin", null);
    Navigator.pushNamed(context, WelcomeNavigation.sid);
  }

  void download() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    String url = 'https://asianbitcoins.org/account_data/?email=' + email;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Release BTC",
            desc: "Release BTC failed due to incorrect OTP")
        .show();
  }

  void verify_otp(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/verify_otp.php?key=anu5781&otp=' +
            otp +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        delete_server();
      } else {
        return _onBasicAlertPressed2(context);
        // return _onBasicAlertPressed4(context, con_id);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void delete_server() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    http.post("https://asianbitcoins.org/abc/api/delete_account.php", body: {
      "key": "anu5781",
      "email": email,
    }).then((res) {
      print(res.statusCode);
      if (res.statusCode == 200) {
        logout();
      }
    }).catchError((err) {
      print(err);
    });
  }

  void send_otp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/send_otp.php?key=anu5781' +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        // return releasetrade(con_id);
      } else {
        //return _onBasicAlertPressed4(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void delete() async {
    String otp;
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    send_otp();
                    Navigator.pop(context);
                    Alert(
                            context: context,
                            content: TextField(
                              onChanged: (text) {
                                otp = text;
                              },
                              decoration:
                                  InputDecoration(hintText: "Enter the otp"),
                            ),
                            buttons: [
                              DialogButton(
                                color: color2,
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  verify_otp(otp);
                                  Navigator.pop(context);
                                },
                              )
                            ],
                            title: "Delete Account",
                            desc: "Please Enter the OTP")
                        .show();
                    // canceltrade(con_id);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  }),
              DialogButton(
                  color: color2,
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // disputetrade(con_id);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Delete Account",
            desc: "Are You Sure You Want to Delete the Account?")
        .show();
  }
}
