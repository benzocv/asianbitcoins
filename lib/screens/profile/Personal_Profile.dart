import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

//int count=0;
Future<Post> fetchPost2(String id) async {
  // BuildContext context;
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/profile_information.php?id=' +
          id +
          '&key=anu5781');
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

  String trade_volume;
  String confirm_trade;
  String feedback_score;
  String account_created;
  String last_seen;
  String email_status;
  String phone_status;
  String tier_status;
  String trusted_people_count;

  // String id;
//  final String title;
//  final String body;

  Post({
    this.message,
    this.trade_volume,
    this.confirm_trade,
    this.feedback_score,
    this.account_created,
    this.last_seen,
    this.email_status,
    this.phone_status,
    this.tier_status,
    this.trusted_people_count,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      trade_volume: json['trade_volume'],
      confirm_trade: json['confirm_trade'],
      feedback_score: json['feedback_score'],
      account_created: json['account_created'],
      last_seen: json['last_seen'],
      email_status: json['email_status'],
      phone_status: json['phone_status'],
      tier_status: json['tier_status'],
      trusted_people_count: json['trusted_people_count'],
      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

class PersonalProfile extends StatefulWidget {
  static const sid = 'personal_profile';

  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  String value;
  bool btcinr = true;
  double btcvalue = 0;
  double inrvalue = 0;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  String username;
  String id;
  String my_id;
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    final CoinDaashboardData args = ModalRoute.of(context).settings.arguments;
    username = args.username;
    id = args.id;
    my_id = args.my_id;
    post = fetchPost2(id);
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
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.solidComments,
                      ),
                      tooltip: 'Show Chat',
                      onPressed: () {
                        Navigator.pushNamed(context, ChatHome.sid);
                      },
                    ),
                  ),
                ],
                iconTheme: IconThemeData(
                  color: color4,
                ),
                centerTitle: true,
                elevation: 0.0,
                title: Text(
                  'Personal Profile',
                  style: text4,
                ),
              ),
              body: Container(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 16, left: 8, right: 8),
                      child: Container(
                        width: width - 32,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: username,
                                style: text2.copyWith(
                                  color: color4,
                                ),
                              ),
                              TextSpan(
                                text: '\n\nInformation on ' + username,
                                style: text13.copyWith(
                                  color: color4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
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
                                    //divider

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
                                                  'Trade volume',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.trade_volume +
                                                      ' BTC',
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'Number of confirmed trades',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.confirm_trade,
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'Feedback score',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.feedback_score +
                                                      ' %',
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'Account created',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.account_created,
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'Last seen',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.last_seen,
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Language',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          'English',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
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
                                                  'Email',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.email_status,
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'Phone number',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  'Verified',
                                                  //snapshot.data.phone_status,
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'Tier verification status',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data.tier_status,
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
//                                    Container(
//                                      width: width - 32,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Expanded(
//                                            child: Column(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.start,
//                                              children: <Widget>[
//                                                Text(
//                                                  'license',
//                                                  style: text13,
//                                                  textAlign: TextAlign.left,
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Column(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.end,
//                                              children: <Widget>[
//                                                Text(
//                                                  '',
//                                                  style: text14,
//                                                  textAlign: TextAlign.right,
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
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
                                                  'Trust',
                                                  style: text13,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  'Trusted by ' +
                                                      snapshot.data
                                                          .trusted_people_count +
                                                      ' people',
                                                  style: text14,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Blocks',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          'Blocked by 0 people',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ), //whitecard

//            Padding(
//              padding: const EdgeInsets.all(16),
//              child: Container(
//                width: width - 32,
//                child: RichText(
//                  textAlign: TextAlign.left,
//                  text: TextSpan(
//                    children: [
//                      TextSpan(
//                        text: 'Buy bitcoins online from user name ',
//                        style: text2.copyWith(
//                          color: color4,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//
//            GestureDetector(
//              onTap: () {},
//              child: Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Container(
//                  color: color1.withOpacity(0.5),
//                  child: Padding(
//                    padding: EdgeInsets.all(8.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            //divider
//
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Price',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          '547650.85 INR / BTC',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Payment Method',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          'IMPS ',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'User',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        RichText(
//                                          textAlign: TextAlign.right,
//                                          text: TextSpan(
//                                            children: <TextSpan>[
//                                              TextSpan(
//                                                text: 'bold',
//                                                style: text14,
//                                              ),
//                                              TextSpan(
//                                                text:
//                                                    ' \n(feedback score 100%)',
//                                                style: text13.copyWith(
//                                                  fontSize: 12,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Price',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          '547650.85 INR / BTC',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Trade limit',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          '1,000 - 24,358 INR',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Location',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          'India',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Payment window',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          '1 hour',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ), //whitecard

//            Padding(
//              padding: const EdgeInsets.all(16),
//              child: Container(
//                width: width - 32,
//                child: RichText(
//                  textAlign: TextAlign.left,
//                  text: TextSpan(
//                    children: [
//                      TextSpan(
//                        text: 'Feedback',
//                        style: text2.copyWith(
//                          color: color4,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//
//            Padding(
//              padding: EdgeInsets.all(8.0),
//              child: Container(
//                color: color1.withOpacity(0.5),
//                child: Padding(
//                  padding: EdgeInsets.all(8.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          //divider
//
//                          Container(
//                            width: width - 32,
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text(
//                                        '• he is honest and i recommed him',
//                                        style: text14,
//                                        textAlign: TextAlign.left,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            width: width - 32,
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text(
//                                        '•  very fast and best rate...',
//                                        style: text14,
//                                        textAlign: TextAlign.left,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            width: width - 32,
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text(
//                                        '• good trade!',
//                                        style: text14,
//                                        textAlign: TextAlign.left,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 8,
                        left: 8,
                        bottom: 8,
                      ),
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                            add_to_truste(my_id, id);
                          },
                          color: color2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                'Trust ' + username,
                                style: text13.copyWith(
                                  color: color1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

//            Padding(
//              padding: const EdgeInsets.all(16.0),
//              child: Container(
//                width: width - 32,
//                child: RichText(
//                  textAlign: TextAlign.left,
//                  text: TextSpan(
//                    children: [
//                      TextSpan(
//                        text: 'Seller escrow release times',
//                        style: text2.copyWith(
//                          color: color4,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//
//            GestureDetector(
//              onTap: () {},
//              child: Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Container(
//                  color: color1.withOpacity(0.5),
//                  child: Padding(
//                    padding: EdgeInsets.all(8.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            //divider
//
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Median',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          '2777 min',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          'Average',
//                                          style: text13,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.end,
//                                      children: <Widget>[
//                                        Text(
//                                          '2905 min',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ), //whitecard

                    //btc value
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
            ));
          }
          if (snapshot.data.message == "0") {
            return Text("failed");
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
                    Navigator.pop(context);
                    //  Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "User Trust",
            desc: "User added to trusted people")
        .show();
  }

  _onBasicAlertPressed7(context) {
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
                    //  Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "User Trust",
            desc: "User is already in trusted people list")
        .show();
  }

  void add_to_truste(String my_id, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/add_trusted_people.php?key=anu5781&email=' +
            email +
            '&my_id=' +
            my_id +
            '&samnevale_ki_id=' +
            id);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        // return releasetrade(con_id);
        return _onBasicAlertPressed6(context);
      } else {
        //return _onBasicAlertPressed4(context);
        return _onBasicAlertPressed7(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
