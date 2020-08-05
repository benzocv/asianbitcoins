import 'package:flutter/material.dart';
//components include
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/components/field_label.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/components/welcome_navigation_buttons.dart';

//screens
//buy
import 'package:asianbitcoins/screens/buy/buy_trade_explore.dart';
//chat
import 'package:asianbitcoins/screens/chat/chat_home.dart';
//dashboard
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
//explore
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
//extra
import 'package:asianbitcoins/screens/extra/trusted_people.dart';
//login
import 'package:asianbitcoins/screens/login/login_screen.dart';
//notification
import 'package:asianbitcoins/screens/notification/notification_home.dart';
//reading
import 'package:asianbitcoins/screens/reading/faq.dart';
import 'package:asianbitcoins/screens/reading/fees.dart';
import 'package:asianbitcoins/screens/reading/guide.dart';
import 'package:asianbitcoins/screens/reading/help.dart';
import 'package:asianbitcoins/screens/reading/how_to_buy.dart';
import 'package:asianbitcoins/screens/reading/support.dart';
//sell
import 'package:asianbitcoins/screens/sell/sell_trade_explore.dart';
//signup
import 'package:asianbitcoins/screens/signup/email_verification.dart';
import 'package:asianbitcoins/screens/signup/phone_verification.dart';
import 'package:asianbitcoins/screens/signup/privacy_policy.dart';
import 'package:asianbitcoins/screens/signup/profile_information_one.dart';
import 'package:asianbitcoins/screens/signup/profile_information_two.dart';
import 'package:asianbitcoins/screens/signup/profile_information_three.dart';
import 'package:asianbitcoins/screens/signup/signup_screeen_one.dart';
import 'package:asianbitcoins/screens/signup/teram_of_service.dart';
import 'package:asianbitcoins/screens/signup/two_factor.dart';
//wallet
import 'package:asianbitcoins/screens/wallet/wallet_send.dart';
//welcome navigation alone screen
import 'package:asianbitcoins/screens/welcome_navigation.dart';
//utilites
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:asianbitcoins/utilites/functionality.dart';
//packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:circular_check_box/circular_check_box.dart';

class ProfileInformationTwo extends StatefulWidget {
  static const sid = 'profile_information_two';

  @override
  _ProfileInformationTwoState createState() => _ProfileInformationTwoState();
}

class _ProfileInformationTwoState extends State<ProfileInformationTwo> {
  String value;
  double lastcontainerheight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 520 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }

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
          'Profile Information',
          style: text4,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: color3,
                        child: Text(
                          '2',
                          style: text2,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' of 3 ',
                        style: text10.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //noofprocess label

            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 5, top: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: color2, width: 2),
                ),
                child: DropdownButtonFormField<PhoneCode>(
                  icon: Icon(
                    FontAwesomeIcons.angleDown,
                    color: color2,
                  ),
                  style: text7,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  hint: Text(
                    "+91 India",
                    style: text8,
                  ),
                  value: selectedphonecode,
                  onChanged: (PhoneCode Value) {
                    setState(() {
                      selectedphonecode = Value;
                    });
                  },
                  items: phoneCodeList.map(
                    (PhoneCode phoneCoedeList) {
                      return DropdownMenuItem<PhoneCode>(
                        value: phoneCoedeList,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: width * 0.5 - 45,
                                  child: Text(
                                    phoneCoedeList.code,
                                    style: text7.copyWith(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: width * 0.5 - 35,
                                  child: Text(
                                    phoneCoedeList.name,
                                    style: text7.copyWith(fontSize: 15),
                                  ),
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
            ), //country dropdown
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 0,
              ),
              child: Text(
                'Choose a country code ',
                style: text11,
              ),
            ), //country code dropdown helping text

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                width: width - 32,
                child: Text(
                  'Phone Number',
                  style: text4,
                ),
              ),
            ), //phone number title
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                onChanged: (text) {
                  value = text;
                  print(value);
                },
                decoration: InputDecoration(
                  hintText: '7778962845',
                  hintStyle: text8,
                  helperText: 'Your phone number without leading zeros.',
                  helperStyle: text11,
                  helperMaxLines: 5,
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
                autofocus: false,
                keyboardType: TextInputType.number,
                style: text7,
                cursorColor: color2,
                cursorWidth: 3,
              ),
            ), //phonenumebr Input

            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: color2, width: 2),
                ),
                child: DropdownButtonFormField<CountryCode>(
                  icon: Icon(
                    FontAwesomeIcons.angleDown,
                    color: color2,
                  ),
                  style: text7,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  hint: Text(
                    "Country of residence",
                    style: text8,
                  ),
                  value: selectedCountry,
                  onChanged: (CountryCode Value) {
                    setState(() {
                      selectedCountry = Value;
                    });
                  },
                  items: country.map(
                    (CountryCode country) {
                      return DropdownMenuItem<CountryCode>(
                        value: country,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  country.name,
                                  style: text7.copyWith(fontSize: 15),
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
            ), //country citizenship dropdown
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 0,
              ),
              child: Text(
                'Country of residence',
                style: text11,
              ),
            ), //country citizenship dropdown helping text

            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 5, top: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: color2, width: 2),
                ),
                child: DropdownButtonFormField<EstimatedTrade>(
                  icon: Icon(
                    FontAwesomeIcons.angleDown,
                    color: color2,
                  ),
                  style: text7,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  hint: Text(
                    "Trade Volume",
                    style: text8,
                  ),
                  value: selectedEstimatedTrade,
                  onChanged: (EstimatedTrade Value) {
                    setState(() {
                      selectedEstimatedTrade = Value;
                    });
                  },
                  items: estimatedTradeList.map(
                    (EstimatedTrade estimatedTradeList) {
                      return DropdownMenuItem<EstimatedTrade>(
                        value: estimatedTradeList,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  estimatedTradeList.limit1,
                                  style: text7.copyWith(fontSize: 15),
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
            ), //trade volume dropdown
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 0,
              ),
              child: Text(
                'Please specify your estimated trade volume in usd for the next 12 monts.',
                style: text11,
                maxLines: 5,
              ),
            ), //trade volume dropdown helping text
          ],
        ),
      ),
//
      bottomNavigationBar: Container(
        color: color2,
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProfileInformationOne.sid);
                },
                child: Container(
                  color: color1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Previous',
                        style: text5.copyWith(
                          color: color4,
                        ),
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
                  Navigator.pushNamed(context, ProfileInformationThree.sid);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Next',
                      style: text5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
