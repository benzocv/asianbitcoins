import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
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
import 'package:asianbitcoins/screens/chat/chat_individual.dart';
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
import 'package:asianbitcoins/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost(String user_one, String user_two, String trade_uid,
    String trade_amount, String type, String price_per_btc) async {
  // BuildContext context;
  if (type == 'sell_btc') {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/sendtraderequest_sellbtc.php?key=anu5781&user_one=' +
            user_one +
            '&user_two=' +
            user_two +
            '&trade_amount=' +
            trade_amount +
            '&trade_uid=' +
            trade_uid +
            '&price_per_btc=' +
            price_per_btc);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  if (type == 'buy_btc') {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/sendtraderequest.php?key=anu5781&user_one=' +
            user_one +
            '&user_two=' +
            user_two +
            '&trade_amount=' +
            trade_amount +
            '&trade_uid=' +
            trade_uid +
            '&price_per_btc=' +
            price_per_btc);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

class Post {
  String message;
  // String id;
//  final String title;
//  final String body;

  Post({this.message});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

Future<TransactionsList> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  // String otp=prefs.getString('otp');

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/chat_home.php?key=anu5781&email=' +
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
  String username;
  String message_recent;
  String con_id;
  String user2;
  String chatstatus;

  // String id;
//  final String title;
//  final String body;

  Post2(
      {this.message,
      this.username,
      this.message_recent,
      this.con_id,
      this.user2,
      this.chatstatus});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
        message: json['message'],
        username: json["user_name"],
        message_recent: json["message_recent"],
        con_id: json["con_id"],
        user2: json["user_two"],
        chatstatus: json["chat_status"]

        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class ChatHome extends StatefulWidget {
  static const sid = 'chat_home';

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Future<TransactionsList> post2;
  String chat_status;
  void initState() {
    super.initState();
    final buy_trade_explore_data args =
        ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    try {
      if (args.user_one != null) {
        fetchPost(args.user_one, args.user_two, args.trade_uid,
            args.trade_amount, args.type, args.price_per_btc);
        // addStringToSF(args.otp);

      }
    } catch (e) {}
    try {
      post2 = fetchPost2();
    } catch (e) {}

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
    return FutureBuilder<TransactionsList>(
      future: post2,
      builder: (context, snapshot) {
        //   */
        if (snapshot.hasData) {
          List<Widget> list = new List();
          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[0].message == "0") {
              list.add(Center(
                  child: Text("Hey! You have not started any trade yet")));
              // _onBasicAlertPressed(context);
            }

            if (snapshot.data.transactions[i].message == "1") {
              if (snapshot.data.transactions[i].chatstatus == "closed") {
                chat_status = "open";
              } else if (snapshot.data.transactions[i].chatstatus ==
                  "completed") {
                chat_status = "closed";
              } else {
                chat_status = snapshot.data.transactions[i].chatstatus;
              }
              list.add(GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChatIndividual.sid,
                      arguments: chat_home_data(
                          snapshot.data.transactions[i].user2,
                          snapshot.data.transactions[i].con_id));
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    color: color8.withOpacity(0.5),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 0),
                                child: Container(
                                  width: (width - 80 - 16) - (width * 0.5),
                                  child: CircleAvatar(
                                    child: Text(
                                      snapshot.data.transactions[i].username
                                          .substring(0, 1),
                                      style: text14,
                                    ),
                                    backgroundColor: color7,
                                    radius: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //string.substring(3);
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 0, left: 8),
                                child: Container(
                                  width: width - 48 - 80,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: snapshot
                                              .data.transactions[i].username,
                                          style: text14,
                                        ),
                                        TextSpan(
                                          text: '\n' + chat_status,
                                          style: text10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ) //whitecard
                  ); //whitecard

            }
          }
          return Container(
              child: Scaffold(
            drawer: SideBar(),
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
                'Chat',
                style: text4,
              ),
            ),
            body: Container(
              child: ListView(children: list),
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

          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          return Container(
              child: Scaffold(
            drawer: SideBar(),
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
                'Chat',
                style: text4,
              ),
            ),
            body: Container(
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text("Nothing Here"),
                  )
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
