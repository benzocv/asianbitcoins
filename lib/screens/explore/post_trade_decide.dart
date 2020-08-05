import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_one.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_one.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class PostTradeDecide extends StatefulWidget {
  static const sid = 'post_trade_decide';

  @override
  _PostTradeDecideState createState() => _PostTradeDecideState();
}

class _PostTradeDecideState extends State<PostTradeDecide> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;

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
    void getpath() {
      if (checkBoxVal == false) {
        Navigator.pushNamed(context, BuyCoinPageOne.sid);
      } else {
        Navigator.pushNamed(context, SellCoinPageOne.sid);
      }
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
                                  height: height * 0.10,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Container(
                              width: width - 32,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'What type of advertisement do you wish to create? If you wish to create sell bitcoins advertisement, make sure you have bitcoins in your Asian Bitcoin’s Wallet.',
                                      style: text9,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Container(
                              width: width - 32,
                              child: Center(
                                child: Container(
                                  width: width * 0.5,
                                  child: Divider(
                                    thickness: 3,
                                    color: color3,
                                  ),
                                ),
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
                                        value: checkBoxVal,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        onChanged: (bool x) {
                                          setState(
                                            () {
                                              checkBoxVal = !checkBoxVal;
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
                                                text: 'Sell Bitcoins Online',
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
                          ), //sell bitcoins
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
                                        value: !checkBoxVal,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        onChanged: (bool x) {
                                          setState(
                                            () {
                                              checkBoxVal = !checkBoxVal;
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
                                                text: 'Buy Bitcoins Online',
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
                          ), //buy bitcoins
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 32),
                            child: Container(
                              width: width - 32,
                              child: Row(
                                children: <Widget>[
//                                  Column(
//                                    children: <Widget>[
//                                      Container(
//                                        width: width * 0.5 - 16,
//                                        child: RichText(
//                                          text: TextSpan(
//                                            children: [
//                                              TextSpan(
//                                                text: '',
//                                                style: text14,
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: width - 32,
                                        child: GestureDetector(
                                          onTap: () {
                                            getpath();
                                          },
                                          child: RichText(
                                            textAlign: TextAlign.center,
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
            ), //whitecard
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
