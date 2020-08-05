import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
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
import 'package:asianbitcoins/screens/settings/email_reset.dart';
import 'package:asianbitcoins/screens/settings/phone_deactivate.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<TransactionsList> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
//  String otp=prefs.getString('otp');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/login_history.php?key=anu5781&email=' +
          email);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    // count++;
    return TransactionsList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class TransactionsList {
  final List<Post2> transactions;

  TransactionsList({
    this.transactions,
  });

  factory TransactionsList.fromJson(List<dynamic> parsedJson) {
    List<Post2> transactions = new List<Post2>();
    transactions = parsedJson.map((i) => Post2.fromJson(i)).toList();

    return TransactionsList(transactions: transactions);
  }
}

class Post2 {
  String message;
  String type;
  String ip;
  String date;
  String time;

  // String id;
//  final String title;
//  final String body;

  Post2({this.message, this.type, this.ip, this.date, this.time});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
        message: json['message'],
        type: json["type"],
        ip: json["ip"],
        date: json["date"],
        time: json["time"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class LoginHistory extends StatefulWidget {
  static const sid = 'login_history';

  @override
  _LoginHistoryState createState() => _LoginHistoryState();
}

class _LoginHistoryState extends State<LoginHistory> {
  String value;
  double lastcontainerheight;
  bool checkboxval = true;
  Future<TransactionsList> post2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post2 = fetchPost2();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<TransactionsList>(
      future: post2,
      builder: (context, snapshot) {
        //   */
        if (snapshot.hasData) {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => Pinset()));
          List<Widget> list = new List();
          List<Widget> list2 = new List();
          List<List> list3 = new List();
          list.add(
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Date',
                    style: text3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
          list.add(
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Type',
                    style: text3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
          list.add(
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'IP Adress',
                    style: text3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
          list2.add(
            Container(
              width: width - 32,
              child: Row(children: list),
            ), //s
          );
          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              list2.add(
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Container(
                    width: width - 32,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                snapshot.data.transactions[i].date +
                                    '\t' +
                                    snapshot.data.transactions[i].time,
                                style: text11,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                snapshot.data.transactions[i].type,
                                style: text11,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                snapshot.data.transactions[i].ip,
                                style: text11,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //single container
              );
            }
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
                child: ChatCount(),
              ),
              title: Text(
                'Login History',
                style: text4,
              ),
            ),
            body: Container(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, bottom: 16, left: 8, right: 8),
                    child: Container(
                      width: width - 32,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Login history',
                              style: text2.copyWith(
                                color: color4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DashboardOpenTrade.sid);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        color: color3.withOpacity(1),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: list2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), //whitecard
                ],
              ),
            ),
//
          ));
          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          //  _onBasicAlertPressed(context);
          // return Text("${snapshot.error}");
          //  return Text("Fuck You");
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
