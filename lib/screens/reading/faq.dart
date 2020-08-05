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

class Faq extends StatefulWidget {
  static const sid = 'faq';

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
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
            'FAQ',
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

                  TextSpan(
                      text: '\n\nWhat is Asianbitcoins.org? \n', style: text7),

                  TextSpan(
                      text:
                          '\nAsianbitcoins is a peer-to-peer Bitcoin exchange. We are a marketplace where users can buy and sell Bitcoins to and from each other. Users, called traders, create advertisements with the price and the payment method they want to offer. You can browse our website for trade advertisements and search for a payment method you prefer. You will find traders buying and selling Bitcoins online for more than 60 different payment methods.If you\'re new to Asianbitcoins and want to buy Bitcoins, please take a look at our how to buy guide to learn how to buy Bitcoins.\n\n'),
                  TextSpan(
                      text: '\n\nHow do I buy or sell Bitcoins? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nTo help you get started with your first Bitcoin trade we\'ve made two short guides to answer all your questions.    If you are looking to buy bitcoins please take a look at our how to buy Bitcoins guide.  If you are looking to sell bitcoins please take a look at our how to sell Bitcoins guide. \n\n'),
                  TextSpan(
                      text: '\n\nHow am I protected from being scammed? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nAll online trades are protected by escrow. When a trade is started the amount of Bitcoins for the trade is automatically reserved from the seller\'s Asianbitcoins Wallet. This means that if the seller runs away with your money and does not release your Bitcoins Asianbitcoins.org support can release the Bitcoins to you from escrow. If you\'re selling Bitcoins, never release the escrow before you know that you have received money from the Bitcoin buyer. \n\n'),
                  TextSpan(
                      text:
                          '\n\nCan I buy less than one Bitcoin? How much does a Bitcoin cost? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nNext to each advertisement on the website the price of a Bitcoin for that advertisement is shown as currency per Bitcoin. For example, if we are buying Bitcoin with the currency US dollars the price would be shown as 10420 USD / BTC. This means that if I wanted to buy 1 Bitcoin it would cost me 10420 US dollars.  Can I buy less than 1 Bitcoin?  Absolutely! In each advertisement you see what\'s called limits. That shows you the least and the most amount of Bitcoins that you can buy from that advertisement. One Bitcoin can be divided into much much smaller pieces, the smallest piece is called one satoshi and is the same as 0.00000001 BTC.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nWhy is it so expensive to buy with Paypal? or Credit card? Why are some payment methods cheaper? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nOne of the best features of Bitcoin is that it gives you control over your money, but it\'s also this feature that makes it very different from traditional money. Bitcoin transactions are irreversible, most traditional payment methods can be charged back. This creates risk for the person selling the Bitcoins, as PayPal or a bank can take the money someone paid him out of his account after he has sent away the Bitcoins. That is why traders need to have a high price for certain payment methods, to protect themselves against this risk.  That is why we recommend for you to get the best price to pay using a hard to reverse payment method, such as Cash Deposit, bank transfers and mobile payments (Like Qiwi in Russia). When you search to buy Bitcoins, select All online offers as a payment method and you will see offers for all payment methods and you can choose one that is convenient for you and offers a better price.  What happens when I pay, and the seller doesn\'t give me my Bitcoins? All our online trades are protected with escrow to prevent this from happening. When the trade is started, the Bitcoin amount for the trade is taken from the sellers wallet and is held by Asianbitcoins for the entire time of the trade. If the seller is trying to scam you, it\'s easy for you to open a dispute on the trade and our support staff will contact you to ask for proof that you have paid and then give the Bitcoins to you. \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow do I send Bitcoins and how can I pay with Bitcoins after buying them? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIf you purchase Bitcoins using Asianbitcoins.org, the Bitcoins will appear in your Asianbitcoins Wallet. From there you can easily send the Bitcoins to other Bitcoin addresses. The vast majority Bitcoin services are compatible with each other, the same Bitcoins you buy from Asianbitcoins will work in your favorite online stores that accept Bitcoin, and also in local shops that accept Bitcoin.  To send Bitcoins from your Asianbitcoins Wallet enter the receiving address and the amount you wish to send and click continue.     On the following page review the details, and enter your password (and your two-factor authentication code, if you have 2FA enabled) to send the transaction.  Please note that your Asianbitcoins Wallet ca\not be used in a few specific situations. For example, you ca\not use it with sites like satoshidice that returns Bitcoins to the sending address. Also newly generated Bitcoins from mining ca\not be sent to your Asianbitcoins Wallet. \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow do I receive Bitcoins to my Asianbitcoins Wallet? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIn order to sell Bitcoins on Asianbitcoins.org you\'ll first need to send some Bitcoins to your Asianbitcoins Wallet. To do that you\'ll need a Asianbitcoins.org account, access to Bitcoins in another Bitcoin wallet and you need to know your Asianbitcoins.org receiving address.    To find your Asianbitcoins.org receiving address you need to go to visit the Wallet page and click the Receive Bitcoins button.   At the top of the page you\'ll find your receiving address. Please note that your receiving address changes after each transaction. We do this to protect your privacy. Your old receiving addresses will eventually expire. The expiring time for receiving addresses is 12 months.  Once you have your Asianbitcoins.org receiving address, you can go to your other Bitcoin wallet and use this address to send Bitcoins to your Asianbitcoins.org address.  Please note that the minimum you can send to your Asianbitcoins wallet is deposit fee. Bitcoin deposits smaller than that are not processed and ca\not be recovered as they are used to pay the fee. \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow long does it take to send or receive Bitcoins using my Asianbitcoins Wallet? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIf all goes well Bitcoin transactions sent with the correct fee take between 10-60 minutes when you are sending Bitcoins to your Asianbitcoins Wallet. If your transaction is taking longer than this, please check that the fee is correct.  Transactions between Asianbitcoins users are instantaneous.  Transactions you send from your Asianbitcoins wallet are sent with a high priority fee to ensure they confirm within approximately 30 minutes (within the next three blocks).  I\'ve waited 60 minutes and my transaction is still pending, now what? Your Bitcoin transaction was most likely sent with a fee that\'s too low or the Bitcoin network might be experiencing congestion, in this case transactions will take much longer to go through. Bitcoin transactions have to be confirmed by the Bitcoin network before they are usable from the wallet they are sent to. You can read more about confirmations on the Bitcoin wikipedia.  To check the status of your Bitcoin transaction    You need to know the transaction id (TX ID) or the receiving wallet address (looks like: 1JF7RrjBzmVymz3cFeGWA7iVg3y6UXxyg) and the amount of Bitcoins transferred. On Asianbitcoins.org you can get the transaction information from your wallet transaction history page after you have sent the transaction.   Go to Tradeblock.org.   Type in the receiving address or the transactions ID (TXID) into the Search field. Use the Bitcoin amount to quickly identify transactions if the receiving address has several transactions incoming.   Click the transaction to view more information about it   Look for where it shows you how many confirmations the transaction has.   If your transaction has...    ...more than six confirmations: the receiving wallet has received the transaction. Please contact the provider of the wallet if the transaction still does not appear in the receiving wallet.   ...0-6 confirmations or unconfirmed: the transaction has left the sending wallet and is still under way.   ...you ca\not find the transaction: the transaction never left from the sending wallet. Contact the provider of the sending wallet.   \n\n'),
                  TextSpan(
                      text:
                          '\n\nI don\'t have a mobile phone. Can I still buy and sell Bitcoins? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nYou can buy Bitcoins without having a mobile phone, but you will be limited to which advertisements you can reply to. By verifying your phone number with Asianbitcoins increases the number of advertisements that you can contact. \n\n'),
                  TextSpan(
                      text: '\n\nWhat is the green dot next to usernames? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nNext to usernames on the front page and on user\'s public profile you can find a small green, yellow or grey dot. This dot shows how quickly the trader will usually reply to trades.   A green dot means the user replies within 5 minutes to trades. A yellow dot means the user replies within 30 minutes to trades. A grey dot means the user takes longer than 30 minutes to reply to trades.  The response time is calculated from the median reply time of all trade of a user from the past 30 days. \n\n'),
                  TextSpan(text: '\n\nWhat is Bitcoin? \n', style: text7),

                  TextSpan(
                      text:
                          '\nBitcoin is a decentralized digital currency, it is not backed by any single country or bank and is usable anywhere in the world by anyone with a computer or smartphone and access to the Internet. To read up more on what Bitcoin is you can take a look at these websites. Coindesk: What is Bitcoin?  We use coins description of Bitcoin \n\n'),
                  TextSpan(
                      text: '\n\nHow should I store my Bitcoins? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nYou can store your Bitcoins in the Asianbitcoins Wallet, but we try to promote other Bitcoin wallets. The best way is to store your Bitcoins in a wallet on your computer or mobile phone, as that gives you complete control over your Bitcoins. Our favourite standalone Bitcoin wallet is Electrum. Paper wallets are a good idea if you want to store Bitcoin securely. Wallets on your smartphone can also be a convenient way of carrying Bitcoins around with you wherever you are.  You can read more in our related blogpost. \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow can I increase the security of my account? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nYou can read our Security Guide which explains on how you can secure your account. Here are a few tips that will protect you against the majority of phishing and hacking attempts.   Enable two-factor authentication for your account. This protects you when a someone finds your password. With two-factor authentication enabled, it is not possible to log in to your account if someone knows only your password. Remember to write down the backup codes, preferably on paper, in case you lose your codes.   Make sure Login guard is enabled. It protects you from logins from unknown web browsers. When Login Guard detects a login from a new web browser it asks you to confirm your browser by clicking a link sent to the email address you have used to register your account. Login Guard is automatically turned on for all new users. Read more about Login Guard   Remember to use a strong password, one with at least 10 characters. To make it easier to remember difficult passwords we recommend you use a password manager such as KeePass ( ), KeePassX ( / ) or 1Password ( / ).   Do not use the same password on other websites and do not give your password to other people, even your friends.   Do not use an email provider that does not require a password, like yopmail, as it makes it possible to access your account without needing to know your password. If you want a secure, anonymous, email use a service such as Tutanota.   You can enable all of these security features under Security from your profile.  With Bitcoins, the owner of the wallet and the Bitcoins is responsible for his/her own security. If your user account is compromised you will lose your Bitcoins, and because Bitcoin transactions are NOT reversible it is not possible for Asianbitcoins to help you get them back. That\'s why it\'s very important to follow the security tips given above.  What should I do if someone else has accessed my account?    Immediately change your password.   Immediately open up a support ticket explaining what happened and include your account name, the email you used to register on Asianbitcoins, your name, IP address, phone number associated with your account and your recent site activity. You can find out your IP address by searching in Google for "What is my IP?".   \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow do I enable two-factor authentication for my account? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nTwo-factor authentication is enabled from the security settings page. We offer two different types of two-factor authentication, mobile based and paper based. We recommend you use mobile based two-factor authentication and only use paper based if you do not have access to a smartphone.  When activating two-factor authentication it is very important that you write down the backup code and keep it in a safe place, preferably on paper. If you lose access to your two-factor codes you will not be able to log in to your account and it will require a two-factor reset which takes two weeks to process.  Activate mobile based two-factor authentication   Visit the two-factor activation page and choose I want to use mobile app based two-factor authentication. Install the authentication app on your phone. Google Authenticator is available on Android, iOS and Windows Phone. You can find it from the app store. On the Asianbitcoins web page, press Proceed to activation.  Write down the backup code shown on the page and keep it in a safe place, preferably on paper. It\'s very important that you do this.  Launch the Google Authenticator app on your smartphone and press Begin Setup.  Select Scan Barcode from the mobile app.  If you are asked, allow the application to take pictures and record video. After this you can scan scan the barcode shown on the Asianbitcoins webpage.  The 2FA codes will now start appearing in the Google Authenticator app. To complete the setup, take the code from the Google Authenticator application and enter it into the Asianbitcoins website in the box Authentication code, type your password in the Your password field and press Enable two-factor authentication.. You\'re now all set and protected by two-factor authentication! Each time you log in to your account you will also be asked for a code that is shown in the authenticator application.  Activate paper based two-factor authentication  Visit the  two-factor activation page and choose I want to use paper codes based two-factor authentication. Click the link to open up your two-factor code list. Press ctrl + p (cmd + p on mac) on your keyboard to print the code table. Press Proceed to activation on the two-factor authentication page and enter the activation key from the top of the paper, the first two-factor authentication code from the table and your password.  You\'re now all set and protected by paper-based two-factor authentication! Each time you log in to your account you will also be asked for a code that is shown in the authenticator application.   Once you\'ve used up all your 90 codes from the paper based code table two-factor authentication will be automatically disabled from your account and you will need to activate two-factor authentication again. \n\n'),
                  TextSpan(
                      text: '\n\nHow does the feedback system work? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nAsianbitcoins.org uses a feedback system that shows a score on your public profile. This score, a percentage, shows how much positive feedback a user has.  You can only give one feedback to a user. The feedback can be one of four types: Trustworthy, Positive, Neutral, Block and Block without feedback. Once given, feedback will be visible on a user\'s public profile if certain conditions are met, otherwise the feedback remains unconfirmed. Unconfirmed feedback is only visible for the receiving user and to Asianbitcoins administrators and does not affect the feedback score.  Users that have never traded can’t leave feedback, however if they mark each other as trusted or not trusted they are able to leave trustworthy, neutral or block feedback. Explanation of feedback types Trustworthy Giving trustworthy feedback increases the receiver\'s feedback score while at the same time marks the receiver as a trusted person. People who you mark as trusted can view your Trusted Only advertisements. You can find a list of people whom you\'ve marked as trusted under your profile.  Positive Giving positive feedback increases the receiver\'s feedback score.  Neutral Giving neutral feedback doesn\'t affect the receiver\'s feedback score.  Block By blocking a user he can no longer contact you, and he receives negative feedback from you which lowers his feedback score.  Block without feedback This option blocks the user from contacting you, but his feedback score remains unaffected. \n\n'),
                  TextSpan(
                      text:
                          '\n\nWhat is the difference between confirmed and unconfirmed feedback? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nFeedback that has been given can be either confirmed or unconfirmed. Confirmed feedback is shown on a user\'s public profile and affects the user\'s feedback score. Unconfirmed feedback is only visible to the receiving user and Asianbitcoins.org administrators. For an unconfirmed feedback to become confirmed, one of the following conditions must be met:    Trades between the user giving and receiving feedback must be more than 0.2 BTC   OR   The total trade volume of the feedback giver must be more than 5 BTC   OR   The feedback giver has verified his ID and a total trade volume of at least 0.1 BTC   \n\n'),
                  TextSpan(
                      text: '\n\nCan I change my feedback? \n', style: text7),

                  TextSpan(
                      text:
                          '\nYes, you can change the feedback you\'ve given someone else. To do so, visit their public profile and scroll down to the feedback section and click the Update your feedback button. You can\'t change feedback that someone else has given you, however, if you believe the feedback has mistakes you can contact your old trading partners through Closed contacts in your Dashboard and ask them to change their feedback. Asianbitcoins.org never edits or removes feedback left by users. The only exception is feedback containing abusive, racist language, threats or exposes personal information. \n\n'),
                  TextSpan(
                      text: '\n\nWhat does Trust user mean? \n', style: text7),

                  TextSpan(
                      text:
                          '\nWhen you visit a user’s profile there is a large button that you can use to mark the user trusted. Trusted users can view trade advertisements that you have created and set to viewable only for trusted users. Traders can use this functionality e.g in order to create ads with better prices for their regular customers and reward repeat business.   \n\n'),
                  TextSpan(
                      text: '\n\nIs it possible to change my username? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nCurrently we do not allow username changes due to security reasons. \n\n'),
                  TextSpan(
                      text: '\n\nHow do I enable web notifications? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nWeb notifications allow you to receive pop-up notifications through your browser whenever you get a new notification on Asianbitcoins. If you\'re trading Bitcoins and want to know immediately when something happens, enable web notifications from your profile.  Tick the box that says Enable Web notifications and when your browser asks you for permission to show web notifications, press accept. You\'re now all set and will start receiving web notifications. \n\n'),
                  TextSpan(
                      text:
                          '\n\nWhere can I see the login history of my account? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nSometimes you want to take a look at your login history, you can find in the security options a page called Login History. It shows you a list of each login to your account. \n\n'),
                  TextSpan(
                      text: '\n\nWhat is Login Guard and how does it work? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nLogin Guard protects your account from logins when someone else knows your username and password. Whenever someone logs in to your account from a new computer or a new web browser an email is sent to address used to register your Asianbitcoins account. This email contains some information on who started the login and a link. You need to click the link to verify your login.  You can take a look at all the browsers that are authorized by Login Guard to login to your account from the Authorized Browsers page in the security options. This page lets you revoke access from a browser if you do not recognize it, e.g. because the location is not yours. If you have trouble getting access to your account using Login Guard you can open up a support ticket to get help. \n\n'),
                  TextSpan(text: '\n\nForum Rules \n', style: text7),

                  TextSpan(
                      text:
                          '\nNo direct or indirect personal attacks or insults will be allowed. Posts that antagonize, insult, belittle users or moderators will not be tolerated. Nor will racism, sexism, bigotry or foul language be accepted. No Bitcoin trades, or advertisements of any other kind may be posted to the forum. Posts talking about, referring to or suggesting tips etc. for illegal actions are strictly forbidden. Posts linking to copyrighted material or web pages containing guides on how to obtain or engage in actions which are illegal are strictly forbidden. Posts containing personally identifiable information (i.e. names, addresses, emails, phone numbers etc.) are not allowed. Posting links to phishing, scamming or hacking websites & guides is not allowed.  Users who are found breaking the rules will have their posts removed and may have their Asianbitcoins.org account ba\ned either for a time period or indefinitely. \n\n'),
                  TextSpan(
                      text:
                          '\n\nA trader is asking me for my ID, and I don\'t feel comfortable. \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nSometimes a trader may ask for your ID. If you are trading for the first time with a trader he/she may ask for you to identify yourself, even if you\'ve already verified your ID with Asianbitcoins. This is because in certain countries sellers are required by local laws to know who their customers are. Most sellers explain in the terms of the trade if they require ID verification or not.  If you do not wish to give the seller your ID, you can always cancel the trade and search for a trader with less strict requirements.  Always send your ID to the seller via the trade chat, our trade chat messages are kept encrypted on our servers and are deleted after 180 days. All photographs sent to the trade chat is also marked with a watermark to prevent misuse of the images. \n\n'),
                  TextSpan(
                      text:
                          '\n\nI\'ve paid the seller but I haven\'t received my Bitcoins yet. Is this normal? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nThe sellers usually release Bitcoins as soon as they see your payment, which can sometimes take an hour or two. If you\'ve paid but are still waiting there is nothing to worry about, for all online trades are protected by escrow and the seller ca\not run away with your Bitcoin.  If there are any issues with a trade and the seller won\'t release your Bitcoins, you can dispute the trade to have Asianbitcoins support resolve it.  If you are buying or selling Bitcoins online, you can dispute the trade after 1 hour if you have marked the payment completed.  A dispute can no longer be started if the Bitcoins have been released from escrow.  When a trade you\'re involved in becomes disputed, you\'ll receive an SMS notification and an email, in most cases simply starting the dispute is enough to get the attention of your trading partner. A disputed trade is usually resolved within 24-48 hours.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nWhy can\'t I send all the Bitcoins that are in my wallet? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nWe reserve a small amount of Bitcoin from your wallet balance to pay the Bitcoin transaction fee to the Bitcoin network. Each Bitcoin transaction has to pay a small fee to the network to be confirmed no matter from where it\'s sent. We reserve this fee in advance to prevent your wallet balance from becoming negative. You can find a list of all of our fees on our fees page. \n\n'),
                  TextSpan(
                      text:
                          '\n\nI\'ve made my payment, but I forgot to press the I have paid button or I did not press it in time \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nThis answer concerns the case when you are buying Bitcoins online.  After you send in a trade request to the seller of Bitcoins, you have a time window to complete the payment before the trade is automatically canceled (the payment window varies depending on the payment method of the trade). During this time you need to complete your payment and press the I have paid button. The seller is notified that you\'ve made the payment and the Bitcoins will be held in escrow until the seller releases them for you when seeing the payment in his/her account.  If you paid for the purchase, but did not mark the payment complete before the payment time window expired, please contact the seller through the trade. The Bitcoin seller has functionality to Reopen the purchase, this also re-enables escrow. You can contact the seller and your other existing trade contacts from the Dashboard in your Asianbitcoins User Profile. Send a message to the seller and kindly explain the situation and why you couldn\'t complete payment within the time window.  If the seller does not respond to this request please contact Asianbitcoins.org support using the Support request form and mention your trade contact id number. \n\n'),
                  TextSpan(
                      text:
                          '\n\nThere are outgoing transactions from the Bitcoin address from where I sent my Bitcoins that aren’t by me! \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nAsianbitcoins Wallet is a web wallet. Sending and receiving transactions are not co\nected to each other. If you are looking at your Asianbitcoins.org Bitcoin address on Tradeblock.org or from any other block explorer you will see transactions that don\'t belong to you.  This is how web wallets operate. You ca\not make co\nections with incoming and outgoing transactions for the same Bitcoin address. \n\n'),
                  TextSpan(
                      text:
                          '\n\nI sent Bitcoins to the wrong address, can I get them back? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nBitcoin transactions are irreversible, once you’ve sent money to another Bitcoin address it is not possible for you or Asianbitcoins.org to reverse it. To get your Bitcoin back you can try to find the owner of the address and ask them to return the Bitcoin to you. From where did you get the address where you sent the Bitcoins to? You can try googling the address to see if is related to any Bitcoin service that has contact details or you can try using a service such as wallet explorer to see if the wallet is tagged as belonging to a Bitcoin company.  Please note that the same wallet can have multiple incoming addresses. The Bitcoin protocol ensures that Bitcoins are not sent to an address that does not exist, but they can be sent to addresses which are inactive or not controlled by anyone. \n\n'),
                  TextSpan(
                      text:
                          '\n\nI\'m not receiving any emails, what can I do? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIf you\'re not receiving emails from Asianbitcoins, there are a few things that you can do.   Check that email in your user profile is correctly typed.  Take a peek in your spam folder, the emails you\'re looking for may be in there. Sometimes an email provider may choose to block emails from a certain domain, you can try changing your email address to see if it helps. If you\'re still having problems receiving emails and can\'t log in to your account you can contact support by clicking here.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nI\'m seeing advertisements from the wrong country. How do I change my search location? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nBelow all the listings on the front page you can find a locations search field, type in your location into the field (city, country) and press enter. After the page reloads you will see ad listings for your location.    \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow can I change the language of the website? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nThe Asianbitcoins website is currently available in English, Spanish, French, Italian, Russian, Brazilian Portuguese and Chinese.  You can change the language of the site from the footer, scroll down all the way to the bottom of the page and click the text next to the globe under the heading Services to see a dropdown of the languages on offer.   \n\n'),
                  TextSpan(
                      text: '\n\nI\'ve forgotten my username \n', style: text7),

                  TextSpan(
                      text:
                          '\nYou can use your email address instead of your username when you login. Just type it in the username field. If you’ve forgotten both you can open up a support ticket and we can help you with regaining access to your account.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nI have lost my username, password and the email I used to register with Asianbitcoins \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIn case you have have forgotten your username, email and password which you have used with Asianbitcoins, visit the support request page and select the option that fits your situation the most and fill out the form and we can help you restore access to your account. \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow do I re-activate Two-factor authentication using my backup code? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIf you have just bought a new smartphone or otherwise need to re-activate your Mobile based two-factor authentication application you can follow these steps. To re-activate your Two-Factor authentication codes with Google Authenticator you will need the backup code that you wrote down during the activation process.   Find your Two-factor authentication backup code from when you first activated two-factor authentication. Install and launch the Google Authenticator app on your mobile device.  Press Begin setup.  Select the option Enter a provided key. Enter Asianbitcoins as the account name. Enter your Two-factor authentication backup code in the key field. Leave the dropdown as Time based.  Press add to re-activate your Two-factor authentication.     You can now use the code the app displays to authenticate your Asianbitcoins account and log in.   If this did not work, or if you do not have the backup code written down, you ca\not re-activate your two-factor authentication and must submit a two-factor authentication removal. You can find a link to submit it while logging in on the page that asks for your two-factor authentication code.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nMy phone number is verified with another user account \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nYour phone number can only be verified with one account. To use your phone number with a different account you must first deactivate your phone number from the previous account. If you can\'t log in to your other account to remove your phone number please contact Asianbitcoins.org support and include the phone number in the ticket. \n\n'),
                  TextSpan(
                      text: '\n\nWhy is my advertisement not showing up? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nThere are many things that affect advertisement visibility, e.g. your trading history; feedback; account age; advertisement settings and more. If your ad is not showing up please check the following list of common problems.   Do you have Bitcoin in your Asianbitcoins wallet?  If you\'re ru\ning advertisements for online payment methods you must have at least 0.04 BTC in your wallet for your ads to show.  My ad is not on the front page?  Only 6 advertisements per category are shown on the front page and certain high risk payment methods are excluded. You need be an experienced trader with many trades under your belt before your ads will show up on the front page.  My ad is not showing when I search!  When you search for advertisements the results show a maximum of 15 advertisements, if there are more advertisements that match the search criteria they can be found by clicking the Show more... link and selecting a payment method. When you gain more trade history, more feedback your advertisements will also be shown as part of the first 15.  Check for errors using the ad visibility tool  If you still can\'t find your ad there might be some problems with the settings on your advertisement. Visit the public page of the problematic advertisement and towards the bottom of the page you\'ll find a tool you can use to check for errors that might prevent it from being displayed.    Click the headings to run a check on your advertisement to see who can open a trade for the ad and who can see it. Any problems with your advertisement not being visible will be shown and explained here.  Open a support ticket You can always open up a support ticket to ask for help with advertisement visibility.  \n\n'),
                  TextSpan(
                      text: '\n\nWhy can\'t I create more advertisements? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nEvery user is limited in how many advertisements he can create, when you start out you can create in total 5 advertisements. If you want to create more, you need more trade volume. \n\n'),
                  TextSpan(
                      text: '\n\nWhen do I receive the pro trader badge? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nBecoming a pro trader is designation all traders strive for as it\'s a badge that only few can get. To be assigned the pro trader badge you need to have fulfilled all of the following criteria:   Your ID must be verified Account registered more than 150 days ago At least 100 positive, confirmed feedbacks You need to have traded at least a total of 20 BTC Your trade volume for the past 30 days needs to be 2 BTC   When your account matches all the above requirements you will automatically receive the pro trader badge. You can click here to view your current trade statistics. Your account registration date and feedback can be viewed from your public profile page.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow do I get the green thumb on my online buy advertisements? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nThe green thumb is assigned automatically to your advertisements based on an algorithm. We don\'t want to share exactly what is required but the following things are looked at. Once your advertisement fulfils all the requirements, it will receive the green thumb.   Number of trades and feedbacks score of your account Age of your account The payment method of your advertisement The popularity of the payment method Recent feedback on your account Total and recent amount of bitcoins traded by you How long ago you completed your first trade.  \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow often are advertisement prices updated? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nAdvertisement prices are based on Bitcoin exchange rates. The Bitcoin exchange rate is volatile and may change rapidly.  Asianbitcoins updates its exchange rates and advertisement prices every five minutes. Prices shown in the listings and on the front page are cached, and update a little slower. Sometimes when the Bitcoin price is fluctuating rapidly, advertisements with the same price equation may display different price. Sometimes market data is not available for some currencies, which leads to delays updating the advertisement prices. However, when you open up the advertisement page itself the price will be more up to date.  The price of the purchase is determined at the moment the Bitcoin buyer sends in the trade request. \n\n'),
                  TextSpan(
                      text: '\n\nWhat is a floating price? \n', style: text7),

                  TextSpan(
                      text:
                          '\nWhen the price is floating, the purchased Bitcoin amount fluctuates with the Bitcoin exchange rate. The traded Bitcoin amount is determined when the trade is closed, instead of when the trade is opened.  The floating price is based on the Asianbitcoins_sell exchange rate variable. The seller can specify an additional margin on top of that. \n\n'),
                  TextSpan(
                      text: '\n\nHow can I specify a dynamic price? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nYou can see pricing how-to to use more complex formulas. If you have javascript enabled, you can use weighted (USD24) or market price (bitstamp) as a base price, and enter your commission percentage to "commission" field.  You can use negative commission percentage too, if you want to sell below market price (or pay extra). \n\n'),
                  TextSpan(
                      text:
                          '\n\nWhat are trusted advertisements and people? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nSome advertisements are marked as Trusted only. These advertisements are only available for accounts that you have marked as trusted in Asianbitcoins.  How can I mark someone as trusted? To add people to your trusted list, you can invite your friends by email, visit their public Asianbitcoins User Profile or give trustworthy feedback after finishing a trade with them. You can find a list of people you trust under your profile.  Creating special deals for trusted people To create a trusted only advertisement, check the option on the advertisement edit form. The seller of Bitcoins decides trust. For a sell advertisement, only people who you have marked as trusted can access it. For a buying advertisement, only people who trust you can access it. \n\n'),
                  TextSpan(
                      text:
                          '\n\nHow can I show to others which users I\'ve ID verified? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nIf you want to show in trades to other users that you\'ve verified the ID of a Asianbitcoins user head over to your profile and tick the box "Show me as real name verifier to others".  Whenever a user whom you have verified his real name opens up a trade with another trader it will show in the security box that you have verified the user\'s real name. This is a handy way to increase the trust of users.  This option is enabled by default for new accounts. \n\n'),
                  TextSpan(
                      text:
                          '\n\nI have a company that I use to trade Bitcoin, can I have a company verified account? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nYou can verify your company with Asianbitcoins, this displays your companies name to your trading partner on the trade page in addition to your own real name.   To verify your company with your Asianbitcoins account you will first need to verify your own ID through the normal ID verification process.   Once that is completed you will gain access to the company verification process, a link will appear on the ID verification page that will allow you to upload your verification documents.   To verify your company you will need to fulfil following requirements:  You are the director of the company OR you are allowed to sign agreements on your company\'s behalf Your company must be searchable in your countries online company database   \n\n'),
                  TextSpan(
                      text:
                          '\n\nWhy canot I send a transaction to a specific wallet address? \n',
                      style: text7),

                  TextSpan(
                      text:
                          '\nTo ensure a safe platform, Asianbitcoins automatically blocks transactions to wallet addresses identified as high risk by our security system.   The most common reasons for this are wallet address association with:   Fraudulent trading Scamming attempts Hacking/Phishing Malware Criminal activity Financing of terrorism   Make sure that your transaction is in accordance with our Terms of Service and try sending it to a different wallet address.  \n\n'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
