import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/screens/wallet/incoming_transactions.dart';
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
import 'package:asianbitcoins/screens/wallet/wallet_receive.dart';
import 'package:asianbitcoins/screens/wallet/wallet_transactions.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String tid_pass = '0';
Future<Post> fetchPost(String btc_address, String receiver_email,
    String comment, String amount) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/sendbtc.php?email=' +
          email +
          '&key=anu5781&btc_address=' +
          btc_address +
          '&receiver_email=' +
          receiver_email +
          '&comment=' +
          comment +
          '&amount=' +
          amount);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.

    // return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
  // prefs.setString('t_status','0');
//count++;
}

Future<TransactionsList> fetchPost2() async {
  // BuildContext context;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');

  final response = await http
      .get('https://asianbitcoins.org/abc/api/transactions.php?email=' + email);
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
  final List<Post> transactions;

  TransactionsList({
    this.transactions,
  });

  factory TransactionsList.fromJson(List<dynamic> parsedJson) {
    List<Post> transactions = new List<Post>();
    transactions = parsedJson.map((i) => Post.fromJson(i)).toList();

    return TransactionsList(transactions: transactions);
  }
}

class Post {
  String message;
  String address;
  String sent_btc;
  String t_fee;
  String received_btc;
  String time;
  String date;
  String status;
  String comment;
  String tid;

  // String id;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.address,
      this.sent_btc,
      this.t_fee,
      this.received_btc,
      this.time,
      this.date,
      this.status,
      this.comment,
      this.tid});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      address: json["address"],
      sent_btc: json["sent_btc"],
      t_fee: json["transaction_fee"],
      received_btc: json["received_btc"],
      time: json["time"],
      date: json["date"],
      status: json["status"],
      comment: json["comment"],
      tid: json["tid"],

      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

class WalletTransactions extends StatefulWidget {
  static const sid = 'wallet_transactions';

  @override
  _WalletTransactionsState createState() => _WalletTransactionsState();
}

class _WalletTransactionsState extends State<WalletTransactions> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Future<TransactionsList> post;

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    post = fetchPost2();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final walletsend_data args = ModalRoute.of(context).settings.arguments;
      if (args != null) {
        fetchPost(args.bitcoin_address, args.email_address, args.comments,
            args.amount);
      }
      //  print(MediaQuery.of(context).size);
    });
  }

  @override
  void didInitState() {
    // No need to call super.didInitState().
    // setState() is not required because build() will automatically be called by Flutter.
    // size = MediaQuery.of(context).size;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //  post = fetchPost2();

    // final walletsend_data args = ModalRoute.of(context).settings.arguments;

    // final twofactor args2=ModalRoute.of(context).settings.arguments;
    // email=args.email;
    // politically_exposed=args.politically_exposed;
    //  firstname=args.firstname;
    //  lastname=args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    /*  if(args2.email!=null) {
      post = fetchPost2(args2.password, args.email);
      status=true;


    }  */
    /* if(args2.email!=null)
      {
        post = fetchPost(args.otp, args.email);
        status=true;
      } */
    //  getStringValuesSF();
    // if(args.email!=null) {

    // status=true;
    // }
  }

  Widget projectWidget() {}
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
    List<Widget> list = new List();
    return FutureBuilder<TransactionsList>(
      future: post,
      builder: (context, snapshot) {
        List<Widget> list = new List();
//          list.add(new Container(
//            width: width,
//            child: Row(
//              children:<Widget>[
//                Expanded(
//                  child: Padding(
//                    padding: const EdgeInsets.all(4.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment
//                          .stretch,
//                      children: <Widget>[
//                        FlatButton(
//                          onPressed: () {
//                            Navigator.pushNamed(
//                                context, WalletSend.sid);
//                          },
//                          child: Padding(
//                            padding: const EdgeInsets.all(
//                                0.0),
//                            child: Text(
//                              'Send',
//                              style: text2.copyWith(
//                                fontSize: 12.0,
//                                letterSpacing: 0,
//                              ),
//                            ),
//                          ),
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius
//                                .circular(10.0),
//                            side: BorderSide(
//                              color: color2,
//                              width: 2,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: Padding(
//                    padding: const EdgeInsets.all(4.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment
//                          .stretch,
//                      children: <Widget>[
//                        FlatButton(
//                          onPressed: () {
//                            Navigator.pushNamed(
//                                context, WalletReceive.sid);
//                          },
//                          child: Padding(
//                            padding: const EdgeInsets.all(
//                                0.0),
//                            child: Text(
//                              'Receive',
//                              style: text2.copyWith(
//                                fontSize: 12.0,
//                                letterSpacing: 0,
//                              ),
//                            ),
//                          ),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius
//                                  .circular(10.0),
//                              side: BorderSide(
//                                color: color2,
//                                width: 2,
//                              )),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: Padding(
//                    padding: const EdgeInsets.all(4.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment
//                          .stretch,
//                      children: <Widget>[
//                        FlatButton(
//                          onPressed: () {
//                            Navigator.pushNamed(
//                                context,
//                                WalletTransactions.sid);
//                          },
//                          color: color1,
//                          child: Padding(
//                            padding: const EdgeInsets.all(
//                                4.0),
//                            child: Text(
//                              'Transaction',
//                              style: text2.copyWith(
//                                fontSize: 12.0,
//                                letterSpacing: 0,
//                              ),
//                            ),
//                          ),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius
//                                  .circular(10.0),
//                              side: BorderSide(
//                                color: color2,
//                                width: 2,
//                              )),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ],
//
//            ),
//          ));
        list.add(
          Container(
            width: width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, WalletTransactions.sid);
                          },
                          color: color1,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              'Internal',
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
                              width: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, IncomingTransactions.sid);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              'External',
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
        );
        list.add(Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
          child: Row(
            children: <Widget>[
              Container(
                width: width - 32,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Internal Transactions',
                        style: text2.copyWith(
                          color: color4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
        if (snapshot.hasData) {
          //   tid_pass=snapshot.data.tid;
          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              if (snapshot.data.transactions[i].status == "sent") {
                list.add(GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DashboardOpenTrade.sid);
                  },
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
                                              'Status',
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
                                              snapshot
                                                  .data.transactions[i].status,
                                              style: text14,
                                              textAlign: TextAlign.right,
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
                                              'Date ',
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
                                              snapshot.data.transactions[i]
                                                      .date +
                                                  ' ' +
                                                  snapshot.data.transactions[i]
                                                      .time,
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
                                  height: 1,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: color2, width: 0.4),
                                  ),
                                ), //border
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
                                              'Sent BTC',
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
                                              double.parse(snapshot
                                                          .data
                                                          .transactions[i]
                                                          .sent_btc)
                                                      .toStringAsFixed(8) +
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
                                  height: 1,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: color2, width: 0.4),
                                  ),
                                ), //border
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
                                              'Comment',
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
                                              snapshot
                                                  .data.transactions[i].comment,
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: Divider(
                                      color: color2,
                                      thickness: 2,
                                    ),
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
                                              'Receiver address',
                                              style: text13,
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
                                              snapshot
                                                  .data.transactions[i].address,
                                              style: text14.copyWith(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }
              if (snapshot.data.transactions[i].status == "received") {
                list.add(GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DashboardOpenTrade.sid);
                  },
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
                                              'Status',
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
                                              snapshot
                                                  .data.transactions[i].status,
                                              style: text14,
                                              textAlign: TextAlign.right,
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
                                              'Date ',
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
                                              snapshot.data.transactions[i]
                                                      .date +
                                                  ' ' +
                                                  snapshot.data.transactions[i]
                                                      .time,
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
                                  height: 1,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: color2, width: 0.4),
                                  ),
                                ), //border
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
                                              'Received BTC',
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
                                              double.parse(snapshot
                                                          .data
                                                          .transactions[i]
                                                          .sent_btc)
                                                      .toStringAsFixed(8) +
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
                                  height: 1,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: color2, width: 0.4),
                                  ),
                                ), //border
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
                                              'Comment',
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
                                              snapshot
                                                  .data.transactions[i].comment,
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: Divider(
                                      color: color2,
                                      thickness: 2,
                                    ),
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
                                              'Sender address',
                                              style: text13,
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
                                              snapshot
                                                  .data.transactions[i].address,
                                              style: text14.copyWith(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }
            }
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
                'Transactions',
                style: text4,
              ),
            ),
            body: Container(
              child: ListView(
                children: list,
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
                        Navigator.pushNamed(context, WalletSend.sid);
                      },
                      child: Container(
                        color: color2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Back to Wallet',
                              style: text4.copyWith(color: color1),
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

          // return list;
          /* if(snapshot.data.message=="0")
            {
             // return Center(child:Text(snapshot.data.message));
            } */

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
