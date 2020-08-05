import 'dart:convert';

import 'package:asianbitcoins/screens/extra/my_referral.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//Future<Post> fetchPost() async {
//  // BuildContext context;
//
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  //Return String
//  String email = prefs.getString('email');
//  final response = await http.get(
//      'https://asianbitcoins.org/abc/api/side_bar.php?email=' +
//          email +
//          '&key=anu5781');
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON.
//    return Post.fromJson(json.decode(response.body));
//  } else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load post');
//  }
//}
import 'package:http/http.dart' as http;
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:badges/badges.dart';

Future<Post> fetchPost() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString('email', email);
  // prefs.setString('t_status','1');
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/getchatcount.php?email=' +
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

  String msg_count;
  // String id;
//  final String title;
//  final String body;

  Post({this.message, this.msg_count});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(message: json['message'], msg_count: json["msg_count"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}
//class Post {
//  String message;
//  String uname;
//  String wallet_balance;
//
//  // String id;
////  final String title;
////  final String body;
//
//  Post({this.message, this.uname, this.wallet_balance});
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
//      message: json['message'],
//      uname: json["uname"],
//      wallet_balance: json["wallet_balance"],
//
//      // id: json['id'],
//      //   title: json['title'],
//      //  body: json['body'],
//    );
//  }
//}

class ChatCount extends StatefulWidget {
  @override
  _ChatCountState createState() => _ChatCountState();
}

class _ChatCountState extends State<ChatCount> {
//  Future<Post> post;
//  void initState() {
//    super.initState();
//    post = fetchPost();
//  }
  Future<Post> post;
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.solidComments,
                    size: 25,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                      ),
                      child: Text(
                        snapshot.data.msg_count,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          //return Text("Fuck You");
        }

        return Dialog(
//          child: Container(
//            color: Color.fromRGBO(18, 18, 18, 1),
//            child: new Row(
//              //     height: 10,
//              mainAxisSize: MainAxisSize.max,
//              children: [
//                new Container(
//                  height: 70,
//                  margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
//                  /*  child: ColorLoader(
//                                            colors: colors,
//                                            duration: Duration(milliseconds: 1200)
//                                        ),*/
//                ),
//                new CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(
//                    Color.fromRGBO(62, 212, 0, 1),
//                  ),
//                ),
//                new SizedBox(
//                  width: 20,
//                ),
//                //     new Container(margin: EdgeInsets.fromLTRB(0,0,5,0),),
//                new Text(
//                  "Loading",
//                  style: TextStyle(color: Colors.white),
//                ),
//              ],
//            ),
//          ),
            );

        // By default, show a loading spinner.
        //     return CircularProgressIndicator();
      },
    );
  }
}
