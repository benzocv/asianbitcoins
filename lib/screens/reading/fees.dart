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

class Fees extends StatefulWidget {
  static const sid = 'fees';

  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  String value;

  double lastcontainerheight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    lastcontainerheight = height - 545 - 70 - 85;
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
            'Fees',
            style: text4,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 16),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: text10,
                children: <TextSpan>[
                  //welcome

                  TextSpan(text: '\n\nBitcoin trading\n', style: text7),
                  TextSpan(
                      text:
                          '\nBuying, selling and registering Bitcoin is completely free. But AsianBitcoin users who creates advertisement are charged a 1% fee for every completed trade.\n\n'),

                  TextSpan(
                      text: '\n\nBitcoin transaction fees\n', style: text7),
                  TextSpan(
                      text:
                          '\n \n\nTransactions to wallets of other AsianBitcoins users are free. But transactions to other Bitcoin wallets are subjected to Bitcoin network transaction fee. The size of the fee change depends on the current usage rate of the Bitcoin blockchain, this fee will be automatically adjusted based on the current network usage to make sure your transactions are confirmed. The transaction fee is paid from your AsianBitcoins wallet when you send a transaction.\n\nA  bitcoin network fee is deducted from the deposit when sent to AsianBitcoins wallet,. The fee depends on how crowded the Bitcoin Network is. If your deposit amount is smaller than the bitcoin deposit fee,than the deposit will not be processed\n\n'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
