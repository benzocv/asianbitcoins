import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/settings/email_reset.dart';
import 'package:asianbitcoins/screens/settings/real_name_info.dart';
import 'package:asianbitcoins/screens/settings/setting_security.dart';
import 'package:asianbitcoins/screens/settings/setting_verification.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

//int count=0;
Future<Post> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/setting_profile.php?key=anu5781&email=' +
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

Future<Post> fetchPost(String intro, String homepage, String sell_vacation,
    String buy_vacation) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/setting_profile_post.php?key=anu5781&email=' +
          email +
          '&intro=' +
          intro +
          '&homepage=' +
          homepage +
          '&sell_vacation=' +
          sell_vacation +
          '&buy_vacation=' +
          buy_vacation);
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
  String homepage;
  String sell_vacation;
  String buy_vacation;
  String email;
  String phone;
  String real_name;
  String tier;
  String annual_trade;
  String t_vol;
  String intro;
  String t_limit;
  String vol_used;

  // String id;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.homepage,
      this.sell_vacation,
      this.buy_vacation,
      this.email,
      this.phone,
      this.real_name,
      this.tier,
      this.annual_trade,
      this.t_vol,
      this.intro,
      this.t_limit,
      this.vol_used});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        message: json['message'],
        homepage: json["homepage"],
        sell_vacation: json["sell_vacation"],
        buy_vacation: json["buy_vacation"],
        email: json["email"],
        phone: json["phone"],
        real_name: json["real_name"],
        tier: json["tier"],
        annual_trade: json["annual_trade"],
        t_vol: json["t_vol"],
        intro: json["intro"],
        t_limit: json["t_limit"],
        vol_used: json["vol_used"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class SettingProfile extends StatefulWidget {
  static const sid = 'setting_profile';

  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  bool prefvisible = false;
  Future<Post> post;
  String intro;
  String homepage;
  String sell_vacation;
  String buy_vacation;

  //checkbox values for prefrences

  bool selling_vacation = false;
  bool buying_vacation = false;
  bool show_me_as_real_name = false;
  bool email_content = false;
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    try {
      post = fetchPost2();
    } catch (e) {
      // SystemChrome.out.println(e);
    }
    //  post = fetchPost();
//    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;

    //    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    // email=args.email;
    //   final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    // email=args.email;
//  String email='anusa@gmail.com';
    //  String pass='anu5781';
    //  post = fetchPost(name,email,pass);
    //  print(MediaQuery.of(context).size);

    // addStringToSF(email);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 510 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        List<Widget> list = new List();
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
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
                                      color: color1,
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

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 16, left: 8, right: 8),
                                  child: Container(
                                    width: width * 0.5 - 16,
                                    child: CircularPercentIndicator(
                                      radius: 100.0,
                                      lineWidth: 8.0,
                                      percent: ((double.parse(
                                              snapshot.data.vol_used)) /
                                          double.parse(snapshot.data.t_limit)),
                                      center: new Text(
                                        ((double.parse(snapshot.data.vol_used) *
                                                        100) /
                                                    double.parse(
                                                        snapshot.data.t_limit))
                                                .toStringAsFixed(2) +
                                            '%',
                                        style: text3,
                                      ),
                                      progressColor: color2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Annual Incoming Trade and Transaction Volume: ' +
                                      double.parse(snapshot.data.vol_used)
                                          .toStringAsFixed(8) +
                                      '/ ' +
                                      double.parse(snapshot.data.t_limit)
                                          .toStringAsFixed(8),
                                  style: text10,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                                        text: 'Email\t\t',
                                                        style: text13.copyWith(
                                                          color: color4,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '\tverified',
                                                        style: text10.copyWith(
                                                          color: color2,
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
                                                  snapshot.data.email,
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, EmailReset.sid);
                                      },
                                      child: Container(
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
                                                              'Mobile Number\t\t',
                                                          style:
                                                              text13.copyWith(
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
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    FlatButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            EmailReset.sid);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Text(
                                                          'Change',
                                                          style: text2.copyWith(
                                                            color: color9,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                                  snapshot.data.phone,
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

                                    //for real name
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RealNameInfo.sid);
                                      },
                                      child: Container(
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
                                                          text: 'Real Name\t\t',
                                                          style:
                                                              text13.copyWith(
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
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    FlatButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            RealNameInfo.sid);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Text(
                                                          'Info',
                                                          style: text2.copyWith(
                                                            fontSize: 12.0,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                                  'We have verified your real name as :' +
                                                      snapshot.data.real_name,
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

                                    //identity verify
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
                                                            'Identity Verified\t\t',
                                                        style: text13.copyWith(
                                                          color: color4,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '\n' +
                                                            snapshot.data.tier,
                                                        style: text10.copyWith(
                                                          color: color2,
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
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          SettingVerification
                                                              .sid);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Text(
                                                        'Verification',
                                                        style: text2.copyWith(
                                                          fontSize: 12.0,
                                                          letterSpacing: 0,
                                                        ),
                                                      ),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 32, right: 32),
                                        child: Divider(
                                          color: color2,
                                          thickness: 2,
                                        ),
                                      ),
                                    ), //divider
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 12,
                                        ),
                                        child: Container(
                                          width: width - 32,
                                          child: Text(
                                            'Introduction',
                                            style: text4,
                                          ),
                                        ),
                                      ),
                                    ), //max limit name
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 8,
                                            bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: color2, width: 2),
                                          ),
                                          width: width - 32,
                                          child: TextFormField(
                                            initialValue: snapshot.data.intro,
                                            onChanged: (text) {
                                              setState(() {
                                                intro = text;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              hintText: '',
                                              hintStyle: text8.copyWith(
                                                fontSize: 15,
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2,
                                                ),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
                                            style: text7,
                                            cursorColor: color2,
                                            cursorWidth: 3,
                                            maxLines: 5,
                                          ),
                                        ),
                                      ),
                                    ), //max limit Input

                                    Container(
                                      width: width - 32,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 0, top: 16),
                                        child: Container(
                                          child: Text(
                                            'Homepage',
                                            style: text4,
                                          ),
                                        ),
                                      ),
                                    ), //phone number title
                                    Container(
                                      width: width - 32,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0.0,
                                          right: 0.0,
                                        ),
                                        child: TextFormField(
                                          initialValue: snapshot.data.homepage,
                                          onChanged: (text) {
                                            value = text;
                                            setState(() {
                                              homepage = text;
                                            });
                                            print(value);
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'https://www.example.com',
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
                                          keyboardType: TextInputType.url,
                                          style: text7,
                                          cursorColor: color2,
                                          cursorWidth: 3,
                                        ),
                                      ),
                                    ), //phonenumebr Input
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), //whitecard
                      Container(
                        width: width - 32,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                prefvisible = !prefvisible;
                                //  print(prefvisible);
                              });
                            },
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Preferences',
                                        style: text4,
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: !prefvisible,
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: prefvisible,
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.keyboard_arrow_up),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ), //prefrences click

                      Visibility(
                        visible: !prefvisible,
                        child: Container(
                          height: 40,
                        ),
                      ),
                      Visibility(
                        visible: prefvisible,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 8.0,
                            left: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Container(
                            color: color1.withOpacity(0.5),
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                CircularCheckBox(
                                                  value: selling_vacation,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  onChanged: (bool x) {
                                                    setState(
                                                      () {
                                                        selling_vacation =
                                                            !selling_vacation;
                                                      },
                                                    );
                                                  },
                                                  activeColor: color2,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: width - 80,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text:
                                                          'Selling Vacation\n',
                                                      style: text3,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'Disable all your advertisements for sale temporarily. ',
                                                          style: text10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ), //check1

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                CircularCheckBox(
                                                  value: buying_vacation,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  onChanged: (bool x) {
                                                    setState(
                                                      () {
                                                        buying_vacation =
                                                            !buying_vacation;
                                                      },
                                                    );
                                                  },
                                                  activeColor: color2,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: width - 80,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: 'Buying Vacation\n',
                                                      style: text3,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'Disable all your advertisements for purchase temporarily. ',
                                                          style: text10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ), //check1

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                CircularCheckBox(
                                                  value: show_me_as_real_name,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  onChanged: (bool x) {
                                                    setState(
                                                      () {
                                                        show_me_as_real_name =
                                                            !show_me_as_real_name;
                                                      },
                                                    );
                                                  },
                                                  activeColor: color2,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: width - 80,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text:
                                                          'Show me as real name verifier to others\n',
                                                      style: text3,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'Your username is shown when people make new trades with your old trading partners.',
                                                          style: text10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ), //check1

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                CircularCheckBox(
                                                  value: email_content,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  onChanged: (bool x) {
                                                    setState(
                                                      () {
                                                        email_content =
                                                            !email_content;
                                                      },
                                                    );
                                                  },
                                                  activeColor: color2,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: width - 80,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text:
                                                          'Disable sensitive information from email notification \n',
                                                      style: text3,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'The e-mail will just ask you to log in to the site, where the actual notification will be.',
                                                          style: text10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ), //check1]
                                    ],
                                  ),
                                ],
                              ),
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
                                      fetchPost(
                                          intro.toString(),
                                          homepage.toString(),
                                          selling_vacation.toString(),
                                          buying_vacation.toString());
                                      _onBasicAlertPressed(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text(
                                        'Save Changes',
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
            title: "Profile Updated",
            desc: "Your Request is submitted Successfully")
        .show();
  }
}
