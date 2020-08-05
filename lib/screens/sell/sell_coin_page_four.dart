import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_five.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_three.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellCoinPageFour extends StatefulWidget {
  static const sid = 'sell_coin_page_four';

  @override
  _SellCoinPageFourState createState() => _SellCoinPageFourState();
}

class _SellCoinPageFourState extends State<SellCoinPageFour> {
  double value;
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

  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;

  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;

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
                            padding: const EdgeInsets.only(top: 0, bottom: 16),
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
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Container(
                              width: width - 32,
                              child: Text(
                                'Opening hour',
                                style: text4,
                              ),
                            ),
                          ), //opening hour

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Sun',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: suns,
                                              //  onSaved: (val) => setState(() => suns_f = val),

                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  suns = Value;
                                                  suns_f = Value;
                                                });
                                              },

                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: sune,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  sune = Value;
                                                  sune_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //first day

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Mon',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: mons,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  mons = Value;
                                                  mons_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: mone,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  mone = Value;
                                                  mone_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //second day

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Tue',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: tues,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  tues = Value;
                                                  tues_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: tuee,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  tuee = Value;
                                                  tuee_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //thired day

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Wed',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: weds,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  weds = Value;
                                                  weds_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: wede,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  wede = Value;
                                                  wede_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //fourth day

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Thu',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: thus,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  thus = Value;
                                                  thus_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: thue,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  thue = Value;
                                                  thue_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //fifth day

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Fri',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: fris,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  fris = Value;
                                                  fris_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: frie,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  frie = Value;
                                                  frie_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //sixth day

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Sat',
                                          style: text13,
                                        ),
                                      ],
                                    ),
                                  ), //day
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "Start",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: sats,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  sats = Value;
                                                  sats_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //suns
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: Container(
                                            width: ((width - 16) / 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: color2, width: 2),
                                            ),
                                            child:
                                                DropdownButtonFormField<Hour>(
                                              icon: Icon(
                                                FontAwesomeIcons.angleDown,
                                                color: color2,
                                              ),
                                              style: text7,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              hint: Text(
                                                "End",
                                                style: text13.copyWith(
                                                  color: color5,
                                                ),
                                              ),
                                              value: sate,
                                              onChanged: (Hour Value) {
                                                setState(() {
                                                  sate = Value;
                                                  sate_f = Value;
                                                });
                                              },
                                              items: hourtime.map(
                                                (Hour hourtime) {
                                                  return DropdownMenuItem<Hour>(
                                                    value: hourtime,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              hourtime.hourtime,
                                                              style: text7
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //sune
                                ],
                              ),
                            ), //first
                          ), //seventh day

                          //next previous buttons
                          //buy bitcoins
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 32),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: width * 0.5 - 16,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, SellCoinPageThree.sid);
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Previous',
                                                  style: text14,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: width * 0.5 - 16,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, SellCoinPageFive.sid,
                                                arguments:
                                                    buycoin_page_four_data(
                                                        location,
                                                        paymethod,
                                                        currency_ex,
                                                        margin_ex,
                                                        bankname,
                                                        min_t_limit_,
                                                        max_t_limit,
                                                        terms_of_trade,
                                                        suns_f,
                                                        sune_f,
                                                        mons_f,
                                                        mone_f,
                                                        tues_f,
                                                        tuee_f,
                                                        weds_f,
                                                        wede_f,
                                                        thus_f,
                                                        thue_f,
                                                        fris_f,
                                                        frie_f,
                                                        sats_f,
                                                        sate_f));
                                          },
                                          child: RichText(
                                            textAlign: TextAlign.right,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Next ',
                                                  style: text14,
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
}
