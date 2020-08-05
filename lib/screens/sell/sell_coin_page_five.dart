import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellCoinPageFive extends StatefulWidget {
  static const sid = 'sell_coin_page_five';

  @override
  _SellCoinPageFiveState createState() => _SellCoinPageFiveState();
}

class _SellCoinPageFiveState extends State<SellCoinPageFive> {
  double value;

  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Hour suns_f;
  Hour sune_f;
  Hour mons_f;
  Hour mone_f;
  Hour tues_f;
  Hour tuee_f;
  Hour weds_f;
  Hour wede_f;
  Hour thus_f;
  Hour thue_f;
  Hour fris_f;
  Hour frie_f;
  Hour sats_f;
  Hour sate_f;

  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;

  String pay_window;
  String identified_people;
  String sms_verification_required;
  String trusted_people;
  String pay_details;
  String min_vol;
  String new_buyer_limit;
  int count = 0;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final buycoin_page_three_data args =
        ModalRoute.of(context).settings.arguments;
    location = args.location;
    paymethod = args.paymethod;
    currency_ex = args.currency_ex;
    bankname = args.bankname;
    margin_ex = args.margin_ex;
    min_t_limit_ = args.min_t_limit_;
    max_t_limit = args.max_t_limit;
    terms_of_trade = args.terms_of_trade;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    //  post = fetchPost(firstname,email,lastname);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 510 - 70 - 85;

    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
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
          'Post Advertisement',
          style: text4,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Container(
                              width: width - 32,
                              child: Center(
                                child: Container(
                                  height: height * 0.05,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Container(
                              width: width - 32,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Sell Bitcoins',
                                      style: text2.copyWith(
                                        color: color4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 16),
                            child: Container(
                              width: width - 32,
                              child: Text(
                                'Payment details',
                                style: text4,
                              ),
                            ),
                          ), //max limit name
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: color2, width: 2),
                              ),
                              width: width - 32,
                              child: TextField(
                                onChanged: (text) {
                                  pay_details = text;
                                },
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  hintText:
                                      'If necessary, please provide details how to transfer money. This is either bank account number for wire transfers or user account for money transfer websites.',
                                  hintStyle: text8.copyWith(
                                    fontSize: 15,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                ),
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                style: text7,
                                cursorColor: color2,
                                cursorWidth: 3,
                                maxLines: 5,
                              ),
                            ),
                          ),

//                          Padding(
//                            padding: const EdgeInsets.only(left: 0, right: 0),
//                            child: Container(
//                              width: width - 32,
//                              child: Text(
//                                'Minimum volume',
//                                style: text4,
//                              ),
//                            ),
//                          ), //min limit
//                          Padding(
//                            padding: const EdgeInsets.only(
//                                left: 0, right: 0, top: 0, bottom: 16),
//                            child: Container(
//                              width: width - 32,
//                              child: TextField(
//                                onChanged: (text) {
//                                  min_vol = text;
//                                },
//                                decoration: InputDecoration(
//                                  hintText: '0',
//                                  hintStyle: text8,
//                                  helperText:
//                                      'How much previous trade volume the buyer is required to have in BTC',
//                                  helperStyle: text11,
//                                  helperMaxLines: 5,
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
//                          ), //min limit Input
//
//                          Padding(
//                            padding: const EdgeInsets.only(left: 0, right: 0),
//                            child: Container(
//                              width: width - 32,
//                              child: Text(
//                                'New buyer limit',
//                                style: text4,
//                              ),
//                            ),
//                          ), //max limit name
//                          Padding(
//                            padding: const EdgeInsets.only(
//                                left: 0, right: 0, top: 0, bottom: 16),
//                            child: Container(
//                              width: width - 32,
//                              child: TextField(
//                                onChanged: (text) {
//                                  new_buyer_limit = text;
//                                },
//                                decoration: InputDecoration(
//                                  hintText: '0',
//                                  hintStyle: text8,
//                                  helperText:
//                                      'Optional. Maximum transaction limit in one trade',
//                                  helperStyle: text11,
//                                  helperMaxLines: 5,
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
//                          ), //max limit Input

                          //max limit Input

                          //next previous buttons
                          //buy bitcoins
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //whitecard
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
                  Navigator.pop(context);
                },
                child: Container(
                  color: color1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Previous',
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
                  if (count <= 0) {
                    fetchPost3(
                      context,
                      location.name,
                      paymethod.payname,
                      currency_ex.currency,
                      margin_ex,
                      min_t_limit_,
                      max_t_limit,
                      terms_of_trade,
                      pay_details,
                    );
                    count++;
                  }
                },
                child: Container(
                  color: color2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Post',
                        style: text5.copyWith(
                          color: color1,
                        ),
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

  fetchPost3(
      context,
      String location,
      String paymethod,
      String currency_ex,
      String margin_ex,
      String min_t_limit_,
      String max_t_limit,
      String terms_of_trade,
      String pay_method) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');

    // BuildContext context;
    final response = await http
        .get('https://asianbitcoins.org/abc/api/sell_trade_post.php?email=' +
            email +
            '&key=anu5781'
                '&location=' +
            location +
            '&paymethod=' +
            paymethod +
            '&currency_ex=' +
            currency_ex +
            '&margin_ex=' +
            margin_ex +
            '&min_t_limit=' +
            min_t_limit_ +
            '&max_t_limit=' +
            max_t_limit +
            '&terms_of_trade=' +
            terms_of_trade +
            '&pay_method=' +
            pay_method);
    if (response.statusCode == 200) {
      // count++;
      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        _onBasicAlertPressed5(context);
        // return releasetrade(con_id);
      } else {
        _onBasicAlertPressed6(context);
      }

      // If the call to the server was successful, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
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
                    Navigator.pushNamed(context, DashboardOpenTrade.sid);
                  })
            ],
            title: "Trade Successful",
            desc: "Trade Successfully Posted")
        .show();
  }

  _onBasicAlertPressed6(context) {
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
                    // Navigator.pushNamed(context, DashboardOpenTrade.sid);
                    Navigator.pop(context);
                  })
            ],
            title: "Trade Post",
            desc:
                "Trade could not be posted as you don't have sufficient BTC in your account")
        .show();
  }
}
