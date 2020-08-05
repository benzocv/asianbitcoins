import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReferralCode extends StatefulWidget {
  static const sid = 'referral_code';

  @override
  _ReferralCodeState createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  String value;
  bool checkboxval = true;

  double lastcontainerheight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: color4,
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.chevronLeft),
          ),
          title: Text(
            'Referral Code',
            style: text4,
          ),
        ),
        body: ListView(
          children: <Widget>[
            //container2 before main avtar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: color3,
                        radius: 50,
                        child: Icon(
                          FontAwesomeIcons.ticketAlt,
                          color: color2,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //mainavtarbox
            //container3 before mail
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width - 32,
                        child: Text(
                          'example@gmail.com',
                          style: text1.copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //email show
            //container4 before thx
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width - 32,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: text2.copyWith(fontSize: 20.0),
                        children: [
                          TextSpan(
                            text:
                                'You can use referral code to get extra bonus !',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), //thx text
            //container5 before notice
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: ' ',
                  style: text9,
                ),
              ),
            ), //notice text
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: TextField(
                onChanged: (text) {
                  value = text;
                  print(value);
                },
                maxLength: 6,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
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
                style: text7.copyWith(
                  letterSpacing: 15,
                ),
                cursorColor: color2,
                cursorWidth: 3,
              ),
            ), //OTP Input
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BuyCoinDashboard.sid,
                  );
                },
                child: Text(
                  'Skip',
                  textAlign: TextAlign.center,
                  style: text6.copyWith(
                    color: color4,
                  ),
                ),
              ),
            ), //notice text
          ],
        ),
        bottomNavigationBar: BottomOne(
          colour: color2,
          text: 'Next',
          ontap: () {
            Navigator.pushNamed(
              context,
              BuyCoinDashboard.sid,
            );
          },
          textStyle: text5,
        ),
      ),
    );
  }
}
