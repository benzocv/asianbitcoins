import 'package:asianbitcoins/screens/buy/buy_coin_page_five.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_four.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_one.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_three.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_two.dart';
import 'package:asianbitcoins/screens/buy/buy_trade_explore.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_cancelled_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_closed_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_completed_trade.dart';
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/extra/my_referral.dart';
import 'package:asianbitcoins/screens/extra/popup.dart';
import 'package:asianbitcoins/screens/extra/referral_code.dart';
import 'package:asianbitcoins/screens/extra/referral_income.dart';
import 'package:asianbitcoins/screens/extra/trusted_people.dart';
import 'package:asianbitcoins/screens/login/login_screen.dart';
import 'package:asianbitcoins/screens/login/pin_enter.dart';
import 'package:asianbitcoins/screens/login/pin_reset.dart';
import 'package:asianbitcoins/screens/login/pin_set.dart';
import 'package:asianbitcoins/screens/notification/notification_home.dart';
import 'package:asianbitcoins/screens/password/forgot_password_enter_email.dart';
import 'package:asianbitcoins/screens/password/forgot_password_otp.dart';
import 'package:asianbitcoins/screens/password/set_new_password.dart';
import 'package:asianbitcoins/screens/profile/Personal_Profile.dart';
import 'package:asianbitcoins/screens/reading/faq.dart';
import 'package:asianbitcoins/screens/reading/fees.dart';
import 'package:asianbitcoins/screens/reading/guide.dart';
import 'package:asianbitcoins/screens/reading/help.dart';
import 'package:asianbitcoins/screens/reading/how_to_buy.dart';
import 'package:asianbitcoins/screens/reading/support.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_five.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_four.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_one.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_three.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_two.dart';
import 'package:asianbitcoins/screens/sell/sell_trade_explore.dart';
import 'package:asianbitcoins/screens/settings/email_reset.dart';
import 'package:asianbitcoins/screens/settings/login_history.dart';
import 'package:asianbitcoins/screens/settings/password_reset.dart';
import 'package:asianbitcoins/screens/settings/phone_deactivate.dart';
import 'package:asianbitcoins/screens/settings/real_name_info.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
import 'package:asianbitcoins/screens/settings/setting_security.dart';
import 'package:asianbitcoins/screens/settings/setting_verification.dart';
import 'package:asianbitcoins/screens/settings/two_factor_authentication.dart';
import 'package:asianbitcoins/screens/signup/email_verification.dart';
import 'package:asianbitcoins/screens/signup/phone_verification.dart';
import 'package:asianbitcoins/screens/signup/privacy_policy.dart';
import 'package:asianbitcoins/screens/signup/profile_information_one.dart';
import 'package:asianbitcoins/screens/signup/profile_information_three.dart';
import 'package:asianbitcoins/screens/signup/profile_information_two.dart';
import 'package:asianbitcoins/screens/signup/signup_screeen_one.dart';
import 'package:asianbitcoins/screens/signup/teram_of_service.dart';
import 'package:asianbitcoins/screens/signup/two_factor.dart';
import 'package:asianbitcoins/screens/wallet/external_txn.dart';
import 'package:asianbitcoins/screens/wallet/incoming_transactions.dart';
import 'package:asianbitcoins/screens/wallet/wallet_receive.dart';
import 'package:asianbitcoins/screens/wallet/wallet_send.dart';
import 'package:asianbitcoins/screens/wallet/wallet_transactions.dart';
import 'package:asianbitcoins/screens/welcome_navigation.dart';
import 'package:flutter/material.dart';

import 'screens/chat/chat_individual.dart';

void main() => runApp(AsianBitcoinsApp());

class AsianBitcoinsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        primaryColor: Color(0xFFFDFFFC),
        scaffoldBackgroundColor: Color(0xFFFDFFFC),
      ),
      initialRoute: WelcomeNavigation.sid,
      routes: {
        WelcomeNavigation.sid: (context) => WelcomeNavigation(),
        //login
        LoginScreen.sid: (context) => LoginScreen(),
        PinEnter.sid: (context) => PinEnter(),
        PinReset.sid: (contest) => PinReset(),
        Pinset.sid: (context) => Pinset(),

        SignUpScreenOne.sid: (context) => SignUpScreenOne(),

        TwoFactor.sid: (context) => TwoFactor(),
        TermOfService.sid: (context) => TermOfService(),
        PrivacyPolicy.sid: (context) => PrivacyPolicy(),
        EmailVerification.sid: (context) => EmailVerification(),
        ProfileInformationOne.sid: (context) => ProfileInformationOne(),
        ProfileInformationTwo.sid: (context) => ProfileInformationTwo(),
        ProfileInformationThree.sid: (context) => ProfileInformationThree(),
        PhoneVerification.sid: (context) => PhoneVerification(),
        BuyTradeExplore.sid: (context) => BuyTradeExplore(),
        SellTradeExplore.sid: (context) => SellTradeExplore(),
        //dashboard
        DashboardOpenTrade.sid: (context) => DashboardOpenTrade(),
        DashboardClosedTrade.sid: (context) => DashboardClosedTrade(),
        DashboardCompletedTrade.sid: (context) => DashboardCompletedTrade(),
        DashboardCancelledTrade.sid: (context) => DashboardCancelledTrade(),

        //wallet
        WalletSend.sid: (context) => WalletSend(),
        WalletReceive.sid: (context) => WalletReceive(),
        WalletTransactions.sid: (context) => WalletTransactions(),
        //extra
        TrustedPeople.sid: (context) => TrustedPeople(),
        PopUp.sid: (context) => PopUp(),
        MyReferral.sid: (context) => MyReferral(),
        ReferralIncome.sid: (context) => ReferralIncome(),
        ReferralCode.sid: (context) => ReferralCode(),
        IncomingTransactions.sid: (context) => IncomingTransactions(),
        ExternalTransactions.sid: (context) => ExternalTransactions(),
        //reading
        Faq.sid: (context) => Faq(),
        Fees.sid: (context) => Fees(),
        Guide.sid: (context) => Guide(),
        Help.sid: (context) => Help(),
        HowToBuy.sid: (context) => HowToBuy(),
        Support.sid: (context) => Support(),

        //chat
        ChatHome.sid: (context) => ChatHome(),
        ChatIndividual.sid: (context) => ChatIndividual(),

        //notificaiton
        NotificationHome.sid: (context) => NotificationHome(),

        //explore coin
        BuyCoinDashboard.sid: (context) => BuyCoinDashboard(),
        SellCoinDashboard.sid: (context) => SellCoinDashboard(),
        PostTradeDecide.sid: (context) => PostTradeDecide(),
        //sell
        SellCoinPageOne.sid: (context) => SellCoinPageOne(),
        SellCoinPageTwo.sid: (context) => SellCoinPageTwo(),
        SellCoinPageThree.sid: (context) => SellCoinPageThree(),
        SellCoinPageFour.sid: (context) => SellCoinPageFour(),
        SellCoinPageFive.sid: (context) => SellCoinPageFive(),

        //buy
        BuyCoinPageOne.sid: (context) => BuyCoinPageOne(),
        BuyCoinPageTwo.sid: (context) => BuyCoinPageTwo(),
        BuyCoinPageThree.sid: (context) => BuyCoinPageThree(),
        BuyCoinPageFour.sid: (context) => BuyCoinPageFour(),
        BuyCoinPageFive.sid: (context) => BuyCoinPageFive(),

        //password
        ForgotPasswordEmail.sid: (context) => ForgotPasswordEmail(),
        ForgetPasswordOtp.sid: (context) => ForgetPasswordOtp(),
        SetNewPassword.sid: (context) => SetNewPassword(),

        //setting
        SettingProfile.sid: (context) => SettingProfile(),

        EmailReset.sid: (context) => EmailReset(),
        PhoneDeactivate.sid: (context) => PhoneDeactivate(),
        RealNameInfo.sid: (context) => RealNameInfo(),

        SettingSecurity.sid: (context) => SettingSecurity(),
        SettingVerification.sid: (context) => SettingVerification(),

        PasswordReset.sid: (context) => PasswordReset(),
        TwoFactorAuthentication.sid: (context) => TwoFactorAuthentication(),
        LoginHistory.sid: (context) => LoginHistory(),

        //profile
        PersonalProfile.sid: (context) => PersonalProfile(),
      },
    );
  }
}
