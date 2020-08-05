import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_cancelled_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_closed_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_completed_trade.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

//int count=0;
Future<TransactionsList> fetchPost() async {
  // BuildContext context;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/getopentrades.php?key=anu5781&email=' +
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
  String trade_info;
  String price_btc;
  String equation;
  String time;
  String date;
  String message;
  String id;
  String trade_type;
  String play_or_pause;
  String currency;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.status,
      this.trade_info,
      this.price_btc,
      this.equation,
      this.time,
      this.date,
      this.id,
      this.trade_type,
      this.play_or_pause,
      this.currency});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        message: json["message"],
        status: json["status"],
        trade_info: json["trade_info"],
        price_btc: json["price_per_btc"],
        equation: json["equation"],
        time: json["time"],
        date: json["date"],
        id: json["id"],
        trade_type: json["trade_type"],
        play_or_pause: json["play_or_pause"],
        currency: json["curr"]);
  }
}

//addStringToSF(String email) async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  prefs.setString('email', email);
//}

class DashboardOpenTrade extends StatefulWidget {
  static const sid = 'dashboard_open_trade';

  @override
  _DashboardOpenTradeState createState() => _DashboardOpenTradeState();
}

class _DashboardOpenTradeState extends State<DashboardOpenTrade> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  bool pause_or_play = true;
  double lastcontainerheight;
  Future<TransactionsList> post;
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      post = fetchPost();
    });

    //addStringToSF(args.email);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                        color: color1,
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
                        color: color3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'All Open \nTrades', //All closed trades
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
          child: Container(
            width: width - 32,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Open Advertisements ', //open trades
                    style: text2.copyWith(
                      color: color4,
                    ),
                  ),
                ],
              ),
            ),
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
            if (snapshot.data.transactions[i].play_or_pause == "1") {
              pause_or_play = true;
            } else {
              pause_or_play = false;
            }
            if (snapshot.data.transactions[i].message == "1") {
              list.add(GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, DashboardOpenTrade.sid);
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
                              //Status of dashboard
//                              Container(
//                                width: width - 32,
//                                child: Row(
//                                  children: <Widget>[
//                                    Expanded(
//                                      child: Column(
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text(
//                                            'Status',
//                                            style: text13,
//                                            textAlign: TextAlign.left,
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Expanded(
//                                      child: Column(
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.end,
//                                        children: <Widget>[
//                                          Text(
//                                            snapshot
//                                                .data.transactions[i].status,
//                                            style: text14,
//                                            textAlign: TextAlign.right,
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ), //single container
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
                                            'Price/BTC',
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
                                                        .price_btc)
                                                    .toStringAsFixed(2) +
                                                ' ' +
                                                snapshot.data.transactions[i]
                                                    .currency,
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
                                            'Equation',
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
                                                .data.transactions[i].equation,
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
                                            'Created at',
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
                                            snapshot.data.transactions[i].date +
                                                ' ' +
                                                snapshot
                                                    .data.transactions[i].time,
                                            style: text14,
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //actions buttons
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
                                            'Action',
                                            style: text13,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: !pause_or_play,
                                      child: Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            pause_or_play = !pause_or_play;
                                            pause_post(
                                              snapshot.data.transactions[i].id,
                                              snapshot.data.transactions[i]
                                                  .trade_type,
                                            );
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Tooltip(
                                                message: 'Pause Trade',
                                                child: Icon(
                                                  Icons.pause,
                                                  color: color2,
                                                ),
                                              ),
//                                              Text(
//                                                '\tPause ad',
//                                                style: text14,
//                                                textAlign: TextAlign.right,
//                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: pause_or_play,
                                      child: Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            pause_or_play = !pause_or_play;
                                            play_post(
                                                snapshot
                                                    .data.transactions[i].id,
                                                snapshot.data.transactions[i]
                                                    .trade_type);
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Tooltip(
                                                message: 'Play Trade',
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: color2,
                                                ),
                                              ),
//                                              Text(
//                                                '\tPlay ad',
//                                                style: text14,
//                                                textAlign: TextAlign.right,
//                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          delete_confirm(
                                              context,
                                              snapshot.data.transactions[i].id,
                                              snapshot.data.transactions[i]
                                                  .trade_type);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Tooltip(
                                              message: 'Delete Trade',
                                              child: Icon(
                                                Icons.delete,
                                                color: color2,
                                              ),
                                            ),
//                                            Text(
//                                              '\tDelete',
//                                              style: text14,
//                                              textAlign: TextAlign.right,
//                                            ),
                                          ],
                                        ),
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
              ));
            }
          }
          if (snapshot.data.transactions.length == 0) {
            list.add(Text(
              "You don’t have any open advertisement",
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

//    return Container(
//        child: Scaffold(
//      drawer: SideBar(),
//      backgroundColor: color3,
//      appBar: AppBar(
//        actions: <Widget>[
//          GestureDetector(
//            onTap: () {
//              Navigator.pushNamed(context, ChatHome.sid);
//            },
//            child: IconButton(
//              icon: const Icon(
//                FontAwesomeIcons.solidComments,
//              ),
//              tooltip: 'Show Chat',
//              onPressed: () {
//                Navigator.pushNamed(context, ChatHome.sid);
//              },
//            ),
//          ),
//          IconButton(
//            icon: const Icon(FontAwesomeIcons.solidBell),
//            tooltip: 'Show Notifications',
//            onPressed: () {
//              Navigator.pushNamed(context, NotificationHome.sid);
//            },
//          ),
//        ],
//        iconTheme: IconThemeData(
//          color: color4,
//        ),
//        centerTitle: true,
//        elevation: 0.0,
//        title: Text(
//          'Dashboard',
//          style: text4,
//        ),
//      ),
//      body: Container(
//        child: ListView(
//          children: <Widget>[
//            Container(
//              width: width,
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.stretch,
//                        children: <Widget>[
//                          FlatButton(
//                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, DashboardOpenTrade.sid);
//                            },
//                            color: color1,
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                'All  Open trades',
//                                style: text2.copyWith(
//                                  fontSize: 15.0,
//                                  letterSpacing: 0,
//                                ),
//                              ),
//                            ),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10.0),
//                                side: BorderSide(
//                                  color: color2,
//                                  width: 2,
//                                )),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.stretch,
//                        children: <Widget>[
//                          FlatButton(
//                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, DashboardClosedTrade.sid);
//                            },
//                            color: color3,
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                'All closed trades',
//                                style: text2.copyWith(
//                                  fontSize: 15.0,
//                                  letterSpacing: 0,
//                                ),
//                              ),
//                            ),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10.0),
//                                side: BorderSide(
//                                  color: color2,
//                                  width: 2,
//                                )),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Container(
//              width: width,
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.stretch,
//                        children: <Widget>[
//                          FlatButton(
//                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, DashboardCompletedTrade.sid);
//                            },
//                            color: color3,
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                'Completed trades',
//                                style: text2.copyWith(
//                                  fontSize: 15.0,
//                                  letterSpacing: 0,
//                                ),
//                              ),
//                            ),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10.0),
//                                side: BorderSide(
//                                  color: color2,
//                                  width: 2,
//                                )),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.stretch,
//                        children: <Widget>[
//                          FlatButton(
//                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, DashboardCancelledTrade.sid);
//                            },
//                            color: color3,
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                'Cancelled trades',
//                                style: text2.copyWith(
//                                  fontSize: 15.0,
//                                  letterSpacing: 0,
//                                ),
//                              ),
//                            ),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10.0),
//                                side: BorderSide(
//                                  color: color2,
//                                  width: 2,
//                                )),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
//              child: Container(
//                width: width - 32,
//                child: RichText(
//                  textAlign: TextAlign.left,
//                  text: TextSpan(
//                    children: [
//                      TextSpan(
//                        text: 'Open Trades ',
//                        style: text2.copyWith(
//                          color: color4,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {
//                Navigator.pushNamed(context, DashboardOpenTrade.sid);
//              },
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
//                                          'Status',
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
//                                          'running',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ), //single container
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
//                                          'Trade info Trade info Trade info Trade info Trade info Trade info Trade info ',
//                                          style: text10,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Padding(
//                                padding:
//                                    const EdgeInsets.only(left: 32, right: 32),
//                                child: Divider(
//                                  color: color2,
//                                  thickness: 2,
//                                ),
//                              ),
//                            ), //divider
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
//                                          'Price/BTC',
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
//                                          '551198.37 INR',
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
//                                          'Equation',
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
//                                          'BTC_IN_USD*1.034',
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
//                                          'Created at',
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
//                                          '1/1/2020 05:03pm',
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
//            GestureDetector(
//              onTap: () {
//                Navigator.pushNamed(context, DashboardOpenTrade.sid);
//              },
//              child: Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Container(
//                  child: Padding(
//                    padding: EdgeInsets.all(8.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
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
//                                          'Status',
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
//                                          'running',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ), //single container
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
//                                          'Trade info Trade info Trade info Trade info Trade info Trade info Trade info ',
//                                          style: text10,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Padding(
//                                padding:
//                                    const EdgeInsets.only(left: 32, right: 32),
//                                child: Divider(
//                                  color: color2,
//                                  thickness: 2,
//                                ),
//                              ),
//                            ), //divider
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
//                                          'Price/BTC',
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
//                                          '551198.37 INR',
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
//                                          'Equation',
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
//                                          'BTC_IN_USD*1.034',
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
//                                          'Created at',
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
//                                          '1/1/2020 05:03pm',
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
//            ),
//            GestureDetector(
//              onTap: () {
//                Navigator.pushNamed(context, DashboardOpenTrade.sid);
//              },
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
//                                          'Status',
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
//                                          'running',
//                                          style: text14,
//                                          textAlign: TextAlign.right,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ), //single container
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
//                                          'Trade info Trade info Trade info Trade info Trade info Trade info Trade info ',
//                                          style: text10,
//                                          textAlign: TextAlign.left,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              width: width - 32,
//                              child: Padding(
//                                padding:
//                                    const EdgeInsets.only(left: 32, right: 32),
//                                child: Divider(
//                                  color: color2,
//                                  thickness: 2,
//                                ),
//                              ),
//                            ), //divider
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
//                                          'Price/BTC',
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
//                                          '551198.37 INR',
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
//                                          'Equation',
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
//                                          'BTC_IN_USD*1.034',
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
//                                          'Created at',
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
//                                          '1/1/2020 05:03pm',
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
//            ),
//          ],
//        ),
//      ),
////
//      bottomNavigationBar: Container(
//        color: color1,
//        height: 70.0,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Expanded(
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.pushNamed(context, BuyCoinDashboard.sid);
//                },
//                child: Container(
//                  color: color1,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        'Buy',
//                        style: text4,
//                        textAlign: TextAlign.center,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//            Expanded(
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.pushNamed(context, SellCoinDashboard.sid);
//                },
//                child: Container(
//                  color: color1,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        'Sell',
//                        style: text4,
//                        textAlign: TextAlign.center,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//            Expanded(
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.pushNamed(context, PostTradeDecide.sid);
//                },
//                child: Container(
//                  color: color1,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        'Post',
//                        style: text4,
//                        textAlign: TextAlign.center,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    ));
  }

  _onBasicAlertPressed1(context) {
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
            title: "Pause Trade",
            desc: "Trade Paused Successfuly")
        .show();
  } //pause success

  _onBasicAlertPressed2(context) {
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
            title: "Resume Trade",
            desc: "Trade Resumed Successfuly")
        .show();
  } //play success

  _onBasicAlertPressed4(context) {
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
            title: "Delete Trade",
            desc: "Trade Deleted Successfuly")
        .show();
  } //play success

  _onBasicAlertPressed3(context) {
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
            title: "Error",
            desc: "Something went wrong action can't be completed!")
        .show();
  } //pause success

  void pause_post(String id, String trade_type) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/pause_post.php?key=anu5781' +
            '&id=' +
            id +
            '&trade_type=' +
            trade_type +
            '&action=pause');
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return _onBasicAlertPressed1(context);
      } else {
        return _onBasicAlertPressed3(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void play_post(String id, String trade_type) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/pause_post.php?key=anu5781' +
            '&id=' +
            id +
            '&trade_type=' +
            trade_type +
            '&action=play');
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return _onBasicAlertPressed2(context);
      } else {
        return _onBasicAlertPressed3(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void delete_post(String id, String trade_type) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/pause_post.php?key=anu5781' +
            '&id=' +
            id +
            '&trade_type=' +
            trade_type +
            '&action=delete');
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return _onBasicAlertPressed4(context);
      } else {
        return _onBasicAlertPressed3(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  _d_btc_confirmation(context, String id, String trade_type) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    delete_post(id, trade_type);
                    // canceltrade(con_id);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  }),
              DialogButton(
                  color: color2,
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // disputetrade(con_id);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Delete Trade",
            desc: "Are You Sure You Want to Delete?")
        .show();
  }

  void delete_confirm(context, String id, String trade_type) async {
    _d_btc_confirmation(context, id, trade_type);
  }
}
