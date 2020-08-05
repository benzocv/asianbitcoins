import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
import 'package:asianbitcoins/screens/settings/setting_security.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//int count=0;
Future<Post> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/setting_verification.php?key=anu5781&email=' +
          email);
  if (response.statusCode == 200) {
    // count++;
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  String message;
  String level;

  // String id;
//  final String title;
//  final String body;

  Post({
    this.message,
    this.level,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(message: json['message'], level: json["level"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class SettingVerification extends StatefulWidget {
  static const sid = 'setting_verification';

  @override
  _SettingVerificationState createState() => _SettingVerificationState();
}

class _SettingVerificationState extends State<SettingVerification> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  bool prefvisible = false;
  Future<Post> post;

  //checkbox values for prefrences
  void initState() {
    super.initState();
    post = fetchPost2();
  }

  bool selling_vacation = false;
  bool buying_vacation = false;
  bool show_me_as_real_name = false;
  bool email_content = false;
  bool visiblevar = false;
  String v1_text;
  Color v1_color;
  String v2_text;
  Color v2_color;
  String v3_text;
  Color v3_color;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        List<Widget> list = new List();
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
            if (snapshot.data.level == "level1") {
              v1_text = "Verified";
              v1_color = color2;
              v2_text = " Not Verified";
              v2_color = color9;
              v3_text = "Not Verified";
              v3_color = color9;
            } else if (snapshot.data.level == "level2") {
              v1_text = "Verified";
              v1_color = color2;
              v2_text = "Verified";
              v2_color = color2;
              v3_text = "Not Verified";
              v3_color = color9;
            } else if (snapshot.data.level == "level3") {
              v1_text = "Verified";
              v1_color = color2;
              v2_text = "Verified";
              v2_color = color2;
              v3_text = "Verified";
              v3_color = color2;
            }
            //  if(snapshot.data.level)
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, SettingSecurity.sid);
                                      },
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, SettingVerification.sid);
                                      },
                                      color: color1,
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

//              Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Column(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(
//                              top: 8, bottom: 16, left: 8, right: 8),
//                          child: Container(
//                            width: width * 0.5 - 16,
//                            child: CircularPercentIndicator(
//                              radius: 60.0,
//                              lineWidth: 5.0,
//                              percent: 0.6,
//                              center: new Text("60%"),
//                              progressColor: color2,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    child: Column(
//                      children: <Widget>[
//                        Text(
//                          'Annual Incoming Trade and Transaction Volume: 19,481.06 INR / 20000 INR',
//                          style: text10,
//                          textAlign: TextAlign.left,
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Container(
                                        width: width - 32,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: v1_color,
                                            width: 2,
                                          ),
                                          borderRadius: new BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(10.0),
                                            topRight:
                                                const Radius.circular(10.0),
                                            bottomRight:
                                                const Radius.circular(10.0),
                                            bottomLeft:
                                                const Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                '\t' + v1_text,
                                                            style:
                                                                text10.copyWith(
                                                              color: v1_color,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '\t\nTier 0',
                                                            style: text3
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Up to 1 BTC/Month trade or transaction volume\n',
                                                            style: text10
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'This level requires the following : \n',
                                                            style: text3
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Visibility(
//                                            visible: !visiblevar,
//                                            child: Column(
//                                              children: <Widget>[
//                                                Container(
//                                                  width: 30,
//                                                  child: Icon(
//                                                    Icons.cancel,
//                                                    color: color4,
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                          Visibility(
//                                            visible: visiblevar,
//                                            child: Column(
//                                              children: <Widget>[
//                                                Container(
//                                                  width: 30,
//                                                  child: Icon(
//                                                    Icons.check_circle,
//                                                    color: color2,
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Email',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.check_circle,
//                                                  color: color2,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Full name',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.check_circle,
//                                                  color: color2,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Phone number',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.check_circle,
//                                                  color: color2,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Country of residence',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ), //tier0
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Container(
                                        width: width - 32,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: v2_color,
                                            width: 2,
                                          ),
                                          borderRadius: new BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(10.0),
                                            topRight:
                                                const Radius.circular(10.0),
                                            bottomRight:
                                                const Radius.circular(10.0),
                                            bottomLeft:
                                                const Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                '\t' + v2_text,
                                                            style: text10
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '\t\nTier 1',
                                                            style: text3
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Up to 25 BTC/Month trade or transaction volume\n',
                                                            style: text10
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'This level requires the following : \n',
                                                            style: text3
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.check_circle,
//                                                  color: color2,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Tier 0 requirements',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.cancel,
//                                                  color: color4,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    ' Tier 1 form',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.cancel,
//                                                  color: color4,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    ' Address validation',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.cancel,
//                                                  color: color4,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    ' Identity verification',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ), //tier1
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Container(
                                        width: width - 32,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: v3_color,
                                            width: 2,
                                          ),
                                          borderRadius: new BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(10.0),
                                            topRight:
                                                const Radius.circular(10.0),
                                            bottomRight:
                                                const Radius.circular(10.0),
                                            bottomLeft:
                                                const Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                '\t' + v3_text,
                                                            style: text10
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '\t\nTier 2',
                                                            style: text3
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Up to 100 BTC/Month trade or transaction volume\n',
                                                            style: text10
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width - 52,
                                                    child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'This level requires the following : \n',
                                                            style: text3
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.cancel,
//                                                  color: color4,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Tier 1 requirements',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.cancel,
//                                                  color: color4,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Tier 2 form',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 30,
//                                                child: Icon(
//                                                  Icons.cancel,
//                                                  color: color4,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width - 62 - 20,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Address verification',
                                                                style: text10
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ), //tier2
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), //whitecard

                      Container(
                        width: width - 16,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      _launchURL(snapshot.data.level);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text(
                                        'Process to the next level ',
                                        style: text2.copyWith(
                                          fontSize: 12.0,
                                          letterSpacing: 0,
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
          }
          if (snapshot.data.message == "0") {
            list.add(Text("failed"));
          }

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
}

_launchURL(String level) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  String url = 'https://asianbitcoins.org/verification/?email=' +
      email +
      '&level=' +
      level;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
