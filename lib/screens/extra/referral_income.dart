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
import 'package:shared_preferences/shared_preferences.dart';

Future<TransactionsList> fetchPost2(String uid) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/refrall_income.php?key=anu5781&email=' +
          email +
          '&uid=' +
          uid);
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
  String date;
  String time;
  String ref_income;

  // String id;
//  final String title;
//  final String body;

  Post2({this.message, this.time, this.date, this.ref_income});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
        message: json['message'],
        date: json["date"],
        time: json["time"],
        ref_income: json["ref_income"]

        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class ReferralIncome extends StatefulWidget {
  static const sid = 'referral_income';

  @override
  _ReferralIncomeState createState() => _ReferralIncomeState();
}

class _ReferralIncomeState extends State<ReferralIncome> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  String name;
  Future<TransactionsList> post2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final refrall args = ModalRoute.of(context).settings.arguments;
    name = args.name;
    post2 = fetchPost2(args.id);
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
          list.add(
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    width: width - 32,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: name,
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
            ),
          );
          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              list.add(
                GestureDetector(
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
                                Container(
                                  width: width - 82,
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
                                  width: width - 82,
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
                                              snapshot.data.transactions[i]
                                                      .ref_income +
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ); //whitecard

            }
            if (snapshot.data.transactions[i].message == "0") {
              list.add(Center(
                  child: Text(
                      "Your referall has not posted any advertisement or their advertisement is not closed yet.")));
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
                'Referral Income',
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
