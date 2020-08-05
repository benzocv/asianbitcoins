import 'dart:convert';

import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/extra/my_referral.dart';
import 'package:asianbitcoins/screens/extra/trusted_people.dart';
import 'package:asianbitcoins/screens/reading/faq.dart';
import 'package:asianbitcoins/screens/reading/fees.dart';
import 'package:asianbitcoins/screens/reading/guide.dart';
import 'package:asianbitcoins/screens/reading/how_to_buy.dart';
import 'package:asianbitcoins/screens/reading/support.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
import 'package:asianbitcoins/screens/wallet/wallet_send.dart';
import 'package:asianbitcoins/screens/welcome_navigation.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost() async {
  // BuildContext context;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/side_bar.php?email=' +
          email +
          '&key=anu5781');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  String message;
  String uname;
  String wallet_balance;

  // String id;
//  final String title;
//  final String body;

  Post({this.message, this.uname, this.wallet_balance});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      uname: json["uname"],
      wallet_balance: json["wallet_balance"],

      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Future<Post> post;
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Post>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.message == "1") {
              return Container(
                width: 275,
                child: Drawer(
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the drawer if there isn't enough vertical
                  // space to fit everything.
                  child: Container(
                    width: 200,
                    color: color3,
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 32,
                                left: 16,
                                right: 16,
                                bottom: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 40.0,
                                        backgroundColor: color3,
                                        backgroundImage:
                                            AssetImage('images/logo.png'),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: 100,
                                              child: Text(
                                                snapshot.data.uname,
                                                style: text12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.btc,
                                            ),
                                            Container(
                                              width: 100,
                                              child: Text(
                                                double.parse(snapshot
                                                        .data.wallet_balance)
                                                    .toStringAsFixed(8),
                                                style: text12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ), //user info and btc
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DashboardOpenTrade.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.dashboard),
                                    Text(
                                      '\t Dashboard',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //dashboard
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, WalletSend.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.account_balance_wallet),
                                    Text(
                                      '\tWallet',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //walllet
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, BuyCoinDashboard.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.bitcoin),
                                    Text(
                                      '\tTrade',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //walllet
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, TrustedPeople.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.star),
                                    Text(
                                      '\tTrusted People',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //trusted
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, MyReferral.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.show_chart),
                                    Text(
                                      '\tMy referral',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //trusted

                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SettingProfile.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.settings),
                                    Text(
                                      '\tSettings',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //Guide
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Guide.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.book),
                                    Text(
                                      '\tGuide',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //Guide
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, HowToBuy.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.explore),
                                    Text(
                                      'How to buy',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //how to buy
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Fees.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.attach_money),
                                    Text(
                                      'Fees',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //fees
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, ChatHome.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.chat_bubble),
                                    Text(
                                      'Chat',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //chat
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Faq.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.error),
                                    Text(
                                      'FAQ',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ), //FAQ
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Support.sid);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.live_help),
                                    Text(
                                      'Support',
                                      style: text12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: color1,
                            ),
                            GestureDetector(
                              onTap: () {
                                logout();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.signOutAlt),
                                    Text(
                                      'Log out\t',
                                      style: text12,
                                    ),
                                    Icon(FontAwesomeIcons.signOutAlt),
                                  ],
                                ),
                              ),
                            ), //logout
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
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
      ),
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", null);
    prefs.setString("pin", null);
    Navigator.pushNamed(context, WelcomeNavigation.sid);
  }
}
