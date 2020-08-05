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
//dashboard
//dashboard
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_closed_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_completed_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_cancelled_trade.dart';
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
import 'package:flutter/services.dart';
//packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:asianbitcoins/main.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

//int count=0;
Future<Post> fetchPost2(String id) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/buy_trade_explore.php?id=' +
          id +
          '&key=anu5781&email=' +
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
  String price_per_btc;
  String pay_method;
  String user_type;
  String max_t_limit;
  String min_t_limit;
  String country;
  String pay_window;
  String user_name;
  String terms;
  String one_btc_value;
  String user_one;
  String user_two;
  String trade_uid;
  String currency;

  // String id;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.price_per_btc,
      this.pay_method,
      this.user_type,
      this.max_t_limit,
      this.min_t_limit,
      this.country,
      this.pay_window,
      this.user_name,
      this.terms,
      this.one_btc_value,
      this.user_one,
      this.user_two,
      this.trade_uid,
      this.currency});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        message: json['message'],
        price_per_btc: json["price_per_btc"],
        pay_method: json["pay_method"],
        user_type: json["message"],
        max_t_limit: json["max_t_limit"],
        min_t_limit: json["min_t_limit"],
        country: json["country"],
        pay_window: json["pay_details"],
        user_name: json["username"],
        terms: json["terms"],
        one_btc_value: json["one_btc_value"],
        user_one: json["user_one"],
        user_two: json["user_two"],
        trade_uid: json["trade_uid"],
        currency: json["currency"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class BuyTradeExplore extends StatefulWidget {
  static const sid = 'buy_trade_explore';

  @override
  _BuyTradeExploreState createState() => _BuyTradeExploreState();
}

class _BuyTradeExploreState extends State<BuyTradeExplore> {
  String value;
  bool btcinr = true;
  double btcvalue = 0;
  double inrvalue = 0;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Future<Post> post;
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    try {
      final String args = ModalRoute.of(context).settings.arguments;
      post = fetchPost2(args);
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
            list.add(Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
              child: Container(
                width: width - 32,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Buy bitcoins with ' +
                            snapshot.data.pay_method +
                            ' in ' +
                            snapshot.data.country,
                        style: text13.copyWith(
                          color: color4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
            list.add(GestureDetector(
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
                                          'Price',
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
                                          snapshot.data.price_per_btc +
                                              ' INR / BTC',
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
                                          'Payment Method',
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
                                          snapshot.data.pay_method,
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
                                          'User',
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
                                        RichText(
                                          textAlign: TextAlign.right,
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'bold',
                                                style: text14,
                                              ),
                                              TextSpan(
                                                text:
                                                    ' \n(feedback score 100%)',
                                                style: text13.copyWith(
                                                  fontSize: 12,
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
                                          'Trade limit',
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
                                          snapshot.data.min_t_limit +
                                              '- ' +
                                              snapshot.data.max_t_limit +
                                              '\t' +
                                              snapshot.data.currency,
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
                                          'Location',
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
                                          snapshot.data.country,
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
                                          'Payment Details',
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
                                          snapshot.data.pay_window,
                                          style: text14,
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                );
            list.add(Visibility(
              visible: btcinr,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width - 32,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                btcvalue.toStringAsFixed(8) + ' BTC',
                                style: text2,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
            list.add(
              Visibility(
                visible: btcinr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width - 32,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data.currency,
                                  style: text13,
                                  textAlign: TextAlign.left,
                                ),
                                TextField(
                                  onChanged: (valin1) {
                                    setState(
                                      () {
                                        inrvalue = double.parse(valin1);
                                        // btcvalue=inrvalue/1000;
                                        btcvalue = inrvalue /
                                            double.parse(
                                                snapshot.data.one_btc_value);
                                      },
                                    );
                                  },
                                  decoration: InputDecoration(
                                    hintText: '$inrvalue',
                                    hintStyle: text8,
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
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  style: text7,
                                  cursorColor: color2,
                                  cursorWidth: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                FloatingActionButton(
                                  backgroundColor: color2,
                                  child: Icon(Icons.swap_vert),
                                  onPressed: () {
                                    setState(() {
                                      btcinr = !btcinr;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //inr to btc field
            );
            list.add(
              Visibility(
                visible: !btcinr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width - 32,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  inrvalue.toStringAsFixed(2) +
                                      snapshot.data.currency,
                                  style: text2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            list.add(
              Visibility(
                visible: !btcinr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width - 32,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'BTC',
                                  style: text13,
                                  textAlign: TextAlign.left,
                                ),
                                TextField(
                                  onChanged: (valin2) {
                                    setState(
                                      () {
                                        btcvalue = double.parse(valin2);
                                        inrvalue = btcvalue *
                                            double.parse(
                                                snapshot.data.one_btc_value);
                                        //      inrvalue=btcvalue * 1000;
                                      },
                                    );
                                  },
                                  decoration: InputDecoration(
                                    hintText: '$btcvalue',
                                    hintStyle: text8,
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
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  style: text7,
                                  cursorColor: color2,
                                  cursorWidth: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                FloatingActionButton(
                                  backgroundColor: color2,
                                  child: Icon(Icons.swap_vert),
                                  onPressed: () {
                                    setState(() {
                                      btcinr = !btcinr;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //btc to inr field
            );
            list.add(
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: width - 32,
                                  child: Text(
                                    'Terms of trade with ' +
                                        snapshot.data.user_name,
                                    style: text13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: width - 32,
                                  child: Text(
                                    snapshot.data.terms,
                                    style: text10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
            list.add(
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
                      if (inrvalue <= double.parse(snapshot.data.max_t_limit) &&
                          inrvalue >= double.parse(snapshot.data.min_t_limit) &&
                          btcvalue >= 0.0007) {
                        Navigator.pushNamed(context, ChatHome.sid,
                            arguments: buy_trade_explore_data(
                                snapshot.data.user_one,
                                snapshot.data.user_two,
                                snapshot.data.trade_uid,
                                btcvalue.toString(),
                                "sell_btc",
                                snapshot.data.price_per_btc));
                      } else {
                        _onBasicAlertPressed5(context);
                      }
                    },
                    color: color2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Send Trade Request',
                        style: text13.copyWith(
                          color: color1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
            list.add(
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
                                          'User has verified email address.',
                                          style: text14,
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
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'User has verified phone number.',
                                          style: text14,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (snapshot.data.message == "0") {
            list.add(Text("failed"));
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
                'Buy Bitcoins',
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

  _onBasicAlertPressed5(context) {
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
            title: "Trade Limit",
            desc:
                "Please put value greater than min value and smaller than max value or atleast more than 0.7 BTC")
        .show();
  }
}
