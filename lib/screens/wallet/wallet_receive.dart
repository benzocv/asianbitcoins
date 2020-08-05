import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/wallet/incoming_transactions.dart';
import 'package:asianbitcoins/screens/wallet/wallet_send.dart';
import 'package:asianbitcoins/screens/wallet/wallet_transactions.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost() async {
  // BuildContext context;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/getwalletaddressapp.php?email=' +
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
  String address;
  String wallet_balance;
  String t_fee;
  String net_bal;
  // String id;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.address,
      this.wallet_balance,
      this.t_fee,
      this.net_bal});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        message: json['message'],
        address: json["address"],
        wallet_balance: json["wallet_balance"],
        t_fee: json["transaction_fee"],
        net_bal: json["net_balance"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class WalletReceive extends StatefulWidget {
  static const sid = 'wallet_receive';

  @override
  _WalletReceiveState createState() => _WalletReceiveState();
}

class _WalletReceiveState extends State<WalletReceive> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Future<Post> post;
  String email;
  void didChangeDependencies() {
    super.didChangeDependencies();
    // final phone_verification_data args = ModalRoute.of(context).settings.arguments;

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
    post = fetchPost();
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

    return Container(
      child: FutureBuilder<Post>(
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
                      child: ChatCount(),
                    ),
                  ],
                  iconTheme: IconThemeData(
                    color: color4,
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                  title: Text(
                    'Wallet',
                    style: text4,
                  ),
                ),
                body: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: width,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, WalletSend.sid);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Text(
                                          'Send',
                                          style: text2.copyWith(
                                            fontSize: 12.0,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, WalletReceive.sid);
                                      },
                                      color: color1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Text(
                                          'Receive',
                                          style: text2.copyWith(
                                            fontSize: 12.0,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, WalletTransactions.sid);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Transaction',
                                          style: text2.copyWith(
                                            fontSize: 12.0,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 16, left: 8, right: 8),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: width - 32,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Receive Bitcoin',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: width - 32,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Your Wallet Balance',
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
                                                                  .wallet_balance)
                                                              .toStringAsFixed(
                                                                  8) +
                                                          ' BTC',
                                                      style: text14,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ), //single container
//                                      Container(
//                                        width: width - 32,
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(8.0),
//                                          child: Row(
//                                            children: <Widget>[
//                                              Expanded(
//                                                child: Column(
//                                                  crossAxisAlignment:
//                                                      CrossAxisAlignment.start,
//                                                  children: <Widget>[
//                                                    Text(
//                                                      'Transaction fee',
//                                                      style: text13,
//                                                      textAlign: TextAlign.left,
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                              Expanded(
//                                                child: Column(
//                                                  crossAxisAlignment:
//                                                      CrossAxisAlignment.end,
//                                                  children: <Widget>[
//                                                    Text(
//                                                      double.parse(snapshot
//                                                                  .data.t_fee)
//                                                              .toStringAsFixed(
//                                                                  8) +
//                                                          ' BTC',
//                                                      style: text14,
//                                                      textAlign:
//                                                          TextAlign.right,
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),

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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Your wallet address',
                                                      style: text13,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Clipboard.setData(
                                                      ClipboardData(
                                                          text: snapshot
                                                              .data.address),
                                                    );
                                                    _onBasicAlertPressed4();
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.content_copy,
                                                        color: color2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width: width - 32,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SelectableText(
                                                      snapshot.data.address,
                                                      style: text14.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width: width - 32,
                                        child: QrImage(
                                          data: snapshot.data.address,
                                          version: QrVersions.auto,
                                          size: 200.0,
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
                      Center(
                        child: Container(
                          width: width * 0.8,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              IncomingTransactions.sid);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            'Incoming Transactions',
                                            style: text6,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                            ],
                          ),
                        ),
                      ),
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

  _onBasicAlertPressed4() {
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
                  })
            ],
            title: "Text copied",
            desc: "Wallet address has been copied to clipboard")
        .show();
  }
}
