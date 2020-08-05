import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyCoinPageFive extends StatefulWidget {
  static const sid = 'buy_coin_page_five';

  @override
  _BuyCoinPageFiveState createState() => _BuyCoinPageFiveState();
}

class _BuyCoinPageFiveState extends State<BuyCoinPageFive> {
  double value;

  bool checkBoxVal1 = false;
  bool checkBoxVal2 = false;
  bool checkBoxVal3 = false;

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
                                      text: 'Buy Bitcoins',
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
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Container(
                              width: width - 32,
                              child: Text(
                                'New buyer limit',
                                style: text4,
                              ),
                            ),
                          ), //max limit name

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircularCheckBox(
                                        value: checkBoxVal1,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        onChanged: (bool x) {
                                          setState(
                                            () {
                                              checkBoxVal1 = !checkBoxVal1;
                                              if (checkBoxVal1 == true) {
                                                identified_people = '1';
                                              } else {
                                                identified_people = '0';
                                              }
                                            },
                                          );
                                        },
                                        activeColor: color2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: width - 80,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Identified people only',
                                                style: text10,
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircularCheckBox(
                                        value: checkBoxVal2,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        onChanged: (bool x) {
                                          setState(
                                            () {
                                              checkBoxVal2 = !checkBoxVal2;

                                              if (checkBoxVal2 == true) {
                                                sms_verification_required = '1';
                                              } else {
                                                sms_verification_required = '0';
                                              }
                                            },
                                          );
                                        },
                                        activeColor: color2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: width - 80,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'SMS verificatrion required',
                                                style: text10,
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

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircularCheckBox(
                                        value: checkBoxVal3,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        onChanged: (bool x) {
                                          setState(
                                            () {
                                              checkBoxVal3 = !checkBoxVal3;
                                              if (checkBoxVal3 == true) {
                                                trusted_people = '1';
                                              } else {
                                                trusted_people = '0';
                                              }
                                            },
                                          );
                                        },
                                        activeColor: color2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: width - 80,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Trusted people only',
                                                style: text10,
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
                    fetchPost2(
                        location.name,
                        paymethod.payname,
                        currency_ex.currency,
                        margin_ex,
                        bankname,
                        min_t_limit_,
                        max_t_limit,
                        terms_of_trade,
                        pay_window,
                        identified_people,
                        sms_verification_required,
                        trusted_people);
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

  fetchPost2(
      String location,
      String paymethod,
      String currency_ex,
      String margin_ex,
      String bankname,
      String min_t_limit_,
      String max_t_limit,
      String terms_of_trade,
      String pay_window,
      String identified_people,
      String sms_verification_required,
      String trusted_people) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String email = prefs.getString('email');
    if (identified_people == null || identified_people == '0') {
      identified_people = '';
    }
    if (sms_verification_required == null || sms_verification_required == '0') {
      sms_verification_required = '';
    }
    if (trusted_people == null || trusted_people == '0') {
      trusted_people = '';
    }

    // BuildContext context;
    final response = await http
        .get('https://asianbitcoins.org/abc/api/buy_trade_post.php?email=' +
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
            '&bankname=' +
            bankname +
            '&min_t_limit=' +
            min_t_limit_ +
            '&max_t_limit=' +
            max_t_limit +
            '&terms_of_trade=' +
            terms_of_trade +
            '&pay_window=' +
            pay_window +
            '&identified_people=' +
            identified_people +
            '&sms_verification_required=' +
            sms_verification_required +
            '&trusted_people=' +
            trusted_people);
    if (response.statusCode == 200) {
      _onBasicAlertPressed5(context);
      // count++;
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
            title: "Trade Successfull",
            desc: "Trade Successfully Posted")
        .show();
  }
}
