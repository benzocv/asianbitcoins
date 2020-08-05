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

class BottomOne extends StatelessWidget {
  BottomOne(
      {@required this.colour,
      @required this.text,
      @required this.ontap,
      @required this.textStyle});
  final Color colour;
  final String text;
  final Function ontap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: colour,
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: textStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
