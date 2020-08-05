import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/wallet/wallet_receive.dart';
import 'package:asianbitcoins/screens/wallet/wallet_transactions.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString('email', email);
  // prefs.setString('t_status','1');
  // SharedPreferences prefs = await SharedPreferences.getInstance();
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
  String msg_count;
  String phone;
  // String id;
//  final String title;
//  final String body;

  Post(
      {this.message,
      this.address,
      this.wallet_balance,
      this.t_fee,
      this.net_bal,
      this.msg_count,
      this.phone});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        message: json['message'],
        address: json["address"],
        wallet_balance: json["wallet_balance"],
        t_fee: json["transaction_fee"],
        net_bal: json["net_balance"],
        msg_count: json["msg_count"],
        phone: json["phone"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class WalletSend extends StatefulWidget {
  static const sid = 'wallet_send';

  @override
  _WalletSendState createState() => _WalletSendState();
}

class _WalletSendState extends State<WalletSend> {
  String bitcoin_address;
  String email_address;
  String value;
  String amount;
  String comments;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Future<Post> post;
  String email;
  TextEditingController _qrcontroller;
  String chat_count;
  String phone;
  void initState() {
    super.initState();
    // email=addStringToSF();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      post = fetchPost();
      email_address = ModalRoute.of(context).settings.arguments;
    });
  }

  /* void didChangeDependencies() {
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
    // status=true;
    // }
  } */
  String barcode = "";
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    //   addStringToSF();
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
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
            //   phone = snapshot.data.phone;
            return Container(
              child: Form(
                key: _formKey2,
                autovalidate: _autoValidate,
                child: Scaffold(
                  drawer: SideBar(),
                  backgroundColor: color3,
                  appBar: AppBar(
                    actions: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ChatHome.sid);
                        },
//                          child: IconButton(
//                            icon: const Icon(
//                              FontAwesomeIcons.solidComments,
//                            ),
//                            tooltip: 'Show Chat',
//                            onPressed: () {
//                              Navigator.pushNamed(context, ChatHome.sid);
//                            },
//                          ),
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
                                        color: color1,
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
                                        text: 'Send Bitcoin',
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
                          onTap: () {
                            Navigator.pushNamed(
                                context, DashboardOpenTrade.sid);
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Your Wallet Balance',
                                                        style: text13,
                                                        textAlign:
                                                            TextAlign.left,
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
                                        Container(
                                          width: width - 32,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Transaction fee',
                                                        style: text13,
                                                        textAlign:
                                                            TextAlign.left,
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
                                                                    .data.t_fee)
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'You can send upto ',
                                                        style: text13,
                                                        textAlign:
                                                            TextAlign.left,
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
                                                                    .net_bal)
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), //whitecard

                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 16),
                          child: Container(
                            width: width - 32,
                            child: Text(
                              'Receiving BTC Wallet Address',
                              style: text13,
                            ),
                          ),
                        ), //Receiving bitcoin address
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 16),
                          child: Container(
                            width: width - 32,
                            child: TextFormField(
                              controller: _qrcontroller,
                              onSaved: (val) =>
                                  setState(() => bitcoin_address = val),
                              onChanged: (text) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.qrcode,
                                    color: color2,
                                  ),
                                  onPressed: () {
                                    scan();
                                  },
                                ),
                                hintText: 'Bitcoin address',
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
                              keyboardType: TextInputType.text,
                              style: text7,
                              cursorColor: color2,
                              cursorWidth: 3,
                            ),
                          ),
                        ),

                        Container(
                          width: width - 32,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Or ',
                                    style: text2.copyWith(
                                      color: color2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 16),
                          child: Container(
                            width: width - 32,
                            child: Text(
                              'Registered Email Address',
                              style: text13,
                            ),
                          ),
                        ), //amount in  bitcoin address
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 16),
                          child: Container(
                            width: width - 32,
                            child: TextFormField(
                              initialValue: email_address,
                              onSaved: (val) =>
                                  setState(() => email_address = val),
                              onChanged: (text) {},
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
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
                              keyboardType: TextInputType.emailAddress,
                              style: text7,
                              cursorColor: color2,
                              cursorWidth: 3,
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 16),
                          child: Container(
                            width: width - 32,
                            child: Text(
                              'Amount in bitcoin',
                              style: text13,
                            ),
                          ),
                        ), //amount in  bitcoin address
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 16),
                          child: Container(
                            width: width - 32,
                            child: TextFormField(
                              onSaved: (val) => setState(() => amount = val),
                              onChanged: (text) {},
                              decoration: InputDecoration(
                                hintText: '0.000',
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
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 16),
                          child: Container(
                            width: width - 32,
                            child: Text(
                              'Description',
                              style: text13,
                            ),
                          ),
                        ), //description
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 16),
                          child: Container(
                            width: width - 32,
                            child: TextFormField(
                              onSaved: (val) => setState(() => comments = val),
                              onChanged: (text) {},
                              decoration: InputDecoration(
                                hintText: '',
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
                              keyboardType: TextInputType.text,
                              style: text7,
                              cursorColor: color2,
                              cursorWidth: 3,
                            ),
                          ),
                        ),

//                          Padding(
//                            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
//                            child: Container(
//                              width: width - 32,
//                              child: Text(
//                                'Amount',
//                                style: text13,
//                              ),
//                            ),
//                          ), //amount in  bitcoin address
//                          Padding(
//                            padding:
//                            const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
//                            child: Container(
//                              width: width - 32,
//                              child: TextField(
//                                onChanged: (text) {},
//                                decoration: InputDecoration(
//                                  hintText: '0 INR',
//                                  hintStyle: text8,
//                                  border: UnderlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: color2,
//                                      width: 2,
//                                    ),
//                                  ),
//                                  enabledBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: color2,
//                                      width: 2,
//                                    ),
//                                  ),
//                                  focusedBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: color2,
//                                      width: 3,
//                                    ),
//                                  ),
//                                ),
//                                autofocus: true,
//                                keyboardType: TextInputType.number,
//                                style: text7,
//                                cursorColor: color2,
//                                cursorWidth: 3,
//                              ),
//                            ),
//                          ),

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
                                    children: <Widget>[],
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
                                          if (_formKey2.currentState
                                              .validate()) {
                                            final FormState form =
                                                _formKey2.currentState;
                                            form.save();
                                            if (double.parse(amount) >= 0.001) {
                                              _r_btc_confirmation(
                                                  context, snapshot.data.phone);
                                            } else {
                                              _onBasicAlertPressed4(context);
                                            }
                                          }
                                        },
                                        color: color2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            'Send',
                                            style: text13.copyWith(
                                              color: color1,
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
                              Navigator.pushNamed(
                                  context, BuyCoinDashboard.sid);
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
                              Navigator.pushNamed(
                                  context, SellCoinDashboard.sid);
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
    );
  }

//  Padding ChatCount(AsyncSnapshot<Post> snapshot) {
//    return Padding(
//      padding: const EdgeInsets.all(15.0),
//      child: Stack(
//        children: <Widget>[
//          Icon(
//            FontAwesomeIcons.solidComments,
//            size: 25,
//          ),
//          Positioned(
//            right: 0,
//            child: Container(
//              padding: EdgeInsets.all(1),
//              decoration: BoxDecoration(
//                color: Colors.red,
//                borderRadius: BorderRadius.circular(8),
//              ),
//              constraints: BoxConstraints(
//                minWidth: 15,
//                minHeight: 15,
//              ),
//              child: Text(
//                snapshot.data.msg_count,
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 12,
//                ),
//                textAlign: TextAlign.center,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }

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
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Release BTC",
            desc: "Release BTC failed due to incorrect OTP")
        .show();
  }

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
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Send BTC",
            desc: "You cannot send less than 0.001 BTC")
        .show();
  }

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
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Sending BTC",
            desc:
                "Sorry email id you have entered is not registered with Asian Bitcoins")
        .show();
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      _qrcontroller = TextEditingController(text: barcode);
      setState(() => this.barcode = barcode);
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  void verify_sender_email(String phone) async {
    final response = await http.get(
        'https://asianbitcoins.org/emailverify/checkemailverify.php?key=anu5781&otp=' +
            '&email=' +
            email_address);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        send_otp(phone);
        // return releasetrade(con_id);
      } else {
        return _onBasicAlertPressed3(this.context);
        // return _onBasicAlertPressed4(context, con_id);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void verify_otp(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/verify_otp.php?key=anu5781&otp=' +
            otp +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        Navigator.pushNamed(this.context, WalletTransactions.sid,
            arguments: walletsend_data(
                bitcoin_address, email_address, amount, comments));
        // return releasetrade(con_id);
      } else {
        return _onBasicAlertPressed2(this.context);
        // return _onBasicAlertPressed4(context, con_id);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void send_otp(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String otp;
    String email = prefs.getString('email');
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/send_otp.php?key=anu5781' +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        Alert(
                context: context,
                content: TextField(
                  onChanged: (text) {
                    otp = text;
                  },
                  decoration: InputDecoration(hintText: "Enter the otp"),
                ),
                buttons: [
                  DialogButton(
                    color: color2,
                    child: Text(
                      'Release',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      verify_otp(otp);
                      Navigator.pop(context);
                    },
                  )
                ],
                title: "Sending BTC",
                desc:
                    "Please enter the OTP which we have just sent to your registered mobile no.xxxxxxx" +
                        phone.substring(7).toString() +
                        " and your registered email id " +
                        email)
            .show();
        // return releasetrade(con_id);
      } else {
        //return _onBasicAlertPressed4(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  _r_btc_confirmation(context, String phone) async {
    String otp;
    String to_address;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    email = prefs.getString('email');
    if (bitcoin_address.isNotEmpty) {
      to_address = bitcoin_address;
    }
    if (email_address.isNotEmpty) {
      to_address = email_address;
    }
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
                    if (email_address.isNotEmpty && bitcoin_address.isEmpty) {
                      verify_sender_email(phone);
                    }
                    if (bitcoin_address.isNotEmpty && email_address.isEmpty) {
                      send_otp(phone);
                      Navigator.pushNamed(this.context, WalletTransactions.sid,
                          arguments: walletsend_data(bitcoin_address,
                              email_address, amount, comments));
                    }
                    Navigator.pop(context);

                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  }),
              DialogButton(
                  color: color2,
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context); // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Sending BTC",
            desc: "Are You Sure You Want to send " +
                amount +
                " BTC to " +
                to_address +
                " ?")
        .show();
  }
}
