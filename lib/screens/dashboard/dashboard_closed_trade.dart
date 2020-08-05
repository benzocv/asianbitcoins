import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_cancelled_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_completed_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//int count=0;
Future<TransactionsList> fetchPost() async {
  // BuildContext context;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/getclosedtrades.php?key=anu5781&email=' +
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
  String status;
  String trade_type;
  String trading_partner;
  String fiat;
  String trade_amount;
  String trade_fee;
  String exchange_rate;
  String trade_info;
  String time;
  String date;
  String message;
  String email;
  // String id;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.status,
      this.trade_type,
      this.trading_partner,
      this.fiat,
      this.trade_amount,
      this.trade_fee,
      this.exchange_rate,
      this.time,
      this.date,
      this.email});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        message: json["message"],
        status: json["status"],
        trade_type: json["trade_type"],
        trading_partner: json["trading_partner"],
        fiat: json["fiat"],
        trade_amount: json["trade_amount"],
        trade_fee: json["trade_fee"],
        exchange_rate: json["price_per_btc"],
        time: json["time"],
        date: json["date"],
        email: json["email"]);
  }
}

class DashboardClosedTrade extends StatefulWidget {
  static const sid = 'dashboard_closed_trade';

  @override
  _DashboardClosedTradeState createState() => _DashboardClosedTradeState();
}

class _DashboardClosedTradeState extends State<DashboardClosedTrade> {
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
    post = fetchPost();
    //addStringToSF(args.email);
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
      future: post,
      builder: (context, snapshot) {
        List<Widget> list = new List();
        list.add(new Container(
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
                          Navigator.pushNamed(context, DashboardOpenTrade.sid);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'All Open \nAdvertisements', //All  Open trades
                            textAlign: TextAlign.center,
                            style: text2.copyWith(
                              fontSize: 15.0,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, DashboardClosedTrade.sid);
                        },
                        color: color1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'All Open \nTrades', //All closed trades
                            style: text2.copyWith(
                              fontSize: 15.0,
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
        ));
        list.add(new Container(
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
                              context, DashboardCompletedTrade.sid);
                        },
                        color: color3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'All Closed \nTrades', //Completed trades
                            textAlign: TextAlign.center,
                            style: text2.copyWith(
                              fontSize: 15.0,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, DashboardCancelledTrade.sid);
                        },
                        color: color3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'All Cancelled/\nDisputed Trades', //Cancelled trades
                            textAlign: TextAlign.center,
                            style: text2.copyWith(
                              fontSize: 15.0,
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
        ));
        list.add(new Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
          child: Row(
            children: <Widget>[
              Container(
                width: width * 0.6 - 16,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Open Trades', //Closed trades
                        style: text2.copyWith(
                          color: color4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width * 0.4 - 16,
                child: FlatButton(
                  onPressed: _launchURL,
//                  onPressed: () {
//
//                   // Navigator.pushNamed(context, DashboardClosedTrade.sid);
//                  },
                  color: color2,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      'Download',
                      style: text13.copyWith(
                        fontSize: 12.0,
                        letterSpacing: 0,
                        color: color1,
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
              ),
            ],
          ),
        ));

//        list.add(Padding(
//          padding:
//          const EdgeInsets.only(
//              top: 8, bottom: 16, left: 8, right: 8),
//          child: Row(
//            children: <Widget>[
//              Container(
//                width: width - 32,
//                child: RichText(
//                  textAlign: TextAlign.left,
//                  text: TextSpan(
//                    children: [
//                      TextSpan(
//                        text: 'Bitcoin Transactions',
//                        style: text2.copyWith(
//                          color: color4,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ));
        if (snapshot.hasData) {
          //   tid_pass=snapshot.data.tid;
          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              list.add(
                GestureDetector(
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
                                //status dashboard
//                                Container(
//                                  width: width - 32,
//                                  child: Row(
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Column(
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.start,
//                                          children: <Widget>[
//                                            Text(
//                                              'Status',
//                                              style: text13,
//                                              textAlign: TextAlign.left,
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                      Expanded(
//                                        child: Column(
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.end,
//                                          children: <Widget>[
//                                            Text(
//                                              snapshot
//                                                  .data.transactions[i].status,
//                                              style: text14,
//                                              textAlign: TextAlign.right,
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ), //single container
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
                                              snapshot.data.transactions[i]
                                                  .trade_info,
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
                                              'Created at ',
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
                                                      .time +
                                                  '\t' +
                                                  snapshot.data.transactions[i]
                                                      .date,
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
                                              'Trade type',
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
                                                  .trade_type,
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
                                              'Trading partner',
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
                                                  .trading_partner,
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
                                //transaction status
//                                Container(
//                                  width: width - 32,
//                                  child: Row(
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Column(
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.start,
//                                          children: <Widget>[
//                                            Text(
//                                              'Transaction status',
//                                              style: text13,
//                                              textAlign: TextAlign.left,
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                      Expanded(
//                                        child: Column(
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.end,
//                                          children: <Widget>[
//                                            Text(
//                                              snapshot
//                                                  .data.transactions[i].status,
//                                              style: text14,
//                                              textAlign: TextAlign.right,
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
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
                                              'Fiat',
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
                                              double.parse(snapshot.data
                                                      .transactions[i].fiat)
                                                  .toStringAsFixed(2),
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
                                              'Trade amount',
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
                                                      .trade_amount)
                                                  .toStringAsFixed(8),
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
                                              'Trading fee',
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
                                                      .trade_fee)
                                                  .toStringAsFixed(8),
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
                                              'Exchange rate',
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
                                                      .exchange_rate)
                                                  .toStringAsFixed(2),
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
                ),
              );
            }
          }
          if (snapshot.data.transactions.length == 0) {
            list.add(Text(
              "You don’t have any open trade.",
              textAlign: TextAlign.center,
            ));
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
                'Dashboard',
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

  _launchURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    String url =
        'https://asianbitcoins.org/abc/api/closedtrades_transaction_uid.php?email=' +
            email;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
