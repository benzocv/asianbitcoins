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

class Guide extends StatefulWidget {
  static const sid = 'guide';

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
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
            'Guide',
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
                      text:
                          'Get yourself comfortable and now shall further start  with our guides\n\n'),
                  TextSpan(text: 'How to buy\n', style: text7),
                  TextSpan(
                      text:
                          '\n Step 1. Register\n\nRegister an account with AsianBitcoins. Further you get a free and secure online bitcoin wallet as No additional apps are needed. And  if you already have an account, skip to the next step.\n\nStep 2. Searching for advertisements\n\nGoing on main page and filling the form given in search box with amount you want to buy in your currency, location and even select your payment method.\n\nBy choosing on “ALL ONLINE OFFERS” the list of bitcoin traders of your region who are available will be shown. this is to be done when you are not sure of how to pay.\n\nStep 3. Selecting an advertisement\n\nFrom the given list of advertisements,  choose one from a trader seeing a good reputation score and a high amount of trades.\n\nThe response time indicator shows if a trader replies\n\nwithin five minutes (green),\n\nwithin 30 minutes (yellow) or\n\nslower than 30 minutes (grey).\n\nYou can click the \'Buy\' button to view more information about an advertisement.\n\nStep 4. Paying the seller\n\nYou\'ll see more information about the advertisement after pressing ‘BUY’ button, including the terms of the trade. Before submitting the trade request read through them and if you don\'t agree with them then you can go back to the previous page and choose another advertisement.\n\nTo start the trade, type and enter a message in the blue box of  how much you want to buy, for the seller and click the Send trade request button to start the trade.\n\nIf  you\'re not ready to pay when clicking the button and haven\'t paid before the\n\npayment window is over, the trade will be automatically cancelled.\n\nStep 5. Mark payment complete\n\nClick I have paid button once you are done with payment. When  the trader has verified that your payment has been received your Bitcoin will be released from escrow and they are instantly available in your AsianBitcoins wallet. And that\'s all there is to it, Congratulations on your first Bitcoin trade!'),

                  TextSpan(text: '\n\nHow to sell Bitcoins\n', style: text7),
                  TextSpan(
                      text:
                          '\nStep 1. Register\n\nRegister an account with AsianBitcoins. Further  you get a free and secure online bitcoin wallet as No additional apps are needed. And if you already have an account you need to sell Bitcoin, so you need to first send them to your AsianBitcoins wallet.\n\n\n\nStep 2. Searching for advertisements\n\nGoing on  the main page and select the option QUICK SELL given in search box and filling  the form with the amount you want to sell in your currency by  selecting  payment method. Choose “ALL ONLINE OFFERS”  as your payment method if you are unsure how you want to be paid.\n\n The site will then list all Bitcoin offers available.\n\n\n\n Note about payment methods: Some payment methods are considered high risk. Bitcoin transactions are completely irreversible. \n\nOnce you sell your Bitcoins it\'s not possible to recover them, even if the buyers payment is reversed so  it’s recommended you  to sell with a low risk payment method to experience users with a large amount of previous trades and 100% feedback.\n\n\n\nStep 3. Selecting an advertisement\n\nFrom the list of offers, choose one where the trader has a good reputation score and a high amount of completed trades. \n\nThe response time indicator shows if a trader replies \n\nwithin five minutes (green), \n\nwithin 30 minutes (yellow) or \n\nslower than 30 minutes (grey).\n\n\n\n You can click the sell button to view more information about an offer.\n\n\n\nStep 4. Open a trade\n\nAfter you press the Sell button you\'ll see more information about the offer, including the terms of the trade. Read through them before submitting the trade request and if you don\'t agree with them then you can go back to the previous page and choose another offer.\n\nTo start the trade, type and enter a message in the blue box for the buyer of how much you want to sell and click the Send trade request button to start the trade.\n\n\n\nOnce you start the trade your Bitcoins will be moved from your wallet to the trade escrow.\n\n\n\nStep 5. Wait for the buyer to pay\n\nAfter you\'ve sent the trade request the buyer will ask you for your payment details and when you have given the seller the payment information the buyer will pay for the \n\nBitcoins and later confirm it to you.\n\n\n\n\n\nPlease make sure that you have received the money into your account before releasing the bitcoins. \n\nNEVER release Bitcoins before you have received payment. Bitcoin transactions are irreversible, once you send the Bitcoins to the buyer there is no other way to get them \n\nback, even if the buyers payment doesn\'t show up.\n\n\n\nOnce you have confirmed the payment has you can then further select and  Release Bitcoins. which  wil furtherl send the Bitcoins from the trade escrow to the buyer and thereby complete the trade.\n\n'),

                  TextSpan(
                      text: '\n\nTwo-Factor Authentication\n', style: text7),
                  TextSpan(
                      text:
                          '\n Protect your Bitcoins with high security log in.\n\nTo login, you need one-time code from mobile phone or printed paper in addition to your password. AsianBitcoins two-factor authentication works with mobile apps or printed paper codes. Many  attacks against you can be prevented with two-factor authentication\n\nTwo-factor authentication codes are hard to steal, unlike passwords and\n\nIt takes only few minutes to set it up!\n\n'),

                  TextSpan(text: '\n\nOther Security Measures\n', style: text7),
                  TextSpan(
                      text:
                          '\n Do not use the same password on different websites.\n\nDo not use Tor browser. Using this puts you in the risk getting your bitcoins stolen.\n\nDo not get involved in transactions outside the AsianBitcoins.\n\nDo not use the website from a shared computers or devices, like ones in public internet cafes, as they may have keyloggers installed to steal your user credentials.\n\nWhen logging in to the website, read the browser address bar and check that you are logging into asianbitcoins.io and not a trolling domain. Make sure the spelling is asianbitcoins.io exactly, as the troller, especially email trollers, often register domain names resembling asianbitcoins.io domain name.\n\nDo not click AsianBitcoins Google advertisements.\n\nIf possible, when accessing Bitcoin wallets, do this from a dedicated computer you have reserved for financial tasks only. Do not use this computer for other tasks. Do not install third party software, pirated software or browser addons you cannot trust 100%. This greatly reduces the risk of getting Bitcoin stealing malware infection on the computer.'),

                  TextSpan(
                      text: '\n\nINTRODUCTION TO TRADING BITCOINS ONLINE\n',
                      style: text7),
                  TextSpan(
                      text:
                          '\n People prefer to buy and sell Bitcoins OTC as that allows fast transactions and more diverse payment methods. Centralized bitcoin exchanges are slow and  trading directly with other people using the same payment provider makes the money move much faster. This creates a better user experience for the customer.\n\n\n\nBenefits of trading on AsianBitcoins.com\n\nThe largest P2P Bitcoin trading platform, AsianBitcoins \n\nQuick and easy way to trade Bitcoins.\n\nEscrow protection for safe trading protects both the buyer and the seller.\n\nReputation system for finding and filtering trustworthy customers.\n\nDynamic pricing system where sources ensures your prices are always up to date.'),

                  TextSpan(
                      text: '\n\nOverview of the trading process\n',
                      style: text7),
                  TextSpan(
                      text:
                          '\n \n\nA typical trade on AsianBitcoins works like an online sell trade where you\'re selling Bitcoins to a buyer. The process is similar when you are buying Bitcoins online, but for now we\'re focusing on selling Bitcoins, as that\'s the most common type of trade.\n\nFirst you need to create a sell Bitcoins online advertisement. choose a payment method when making an advertisement online, setting your price, your limits and write your terms of trade as a free form message.\n\nThen you need to fund your AsianBitcoins.io wallet with Bitcoin in order  to be able to open trade requests from your advertisements.\n\nWhen a buyer opens a trade with you, Bitcoin for the full amount of the trade is automatically taken from your wallet into escrow. Give the buyer payment instructions and guide the buyer through paying for the trade. You will receive email and SMS notifications when someone replies to your advertisement.\n\nOnce the buyer has paid and pressed the I have paid button you will receive a notification via e-mail, SMS and on the website that a trade has been paid for.\n\nWhen you\'ve confirmed that you have received the payment it\'s time for you to release the Bitcoins. This moves the Bitcoins from escrow to the buyers AsianBitcoins wallet.\n\nThe final step is to Leave feedback for the buyer and encourage the buyer to do the same for you. Feedback is important in order to gain reputation and make more trades.'),

                  TextSpan(text: '\n\nGetting started\n', style: text7),
                  TextSpan(
                      text:
                          '\n Before you start trading you need to consider what payment methods you are going to provide and research regarding the payment method so that you know how it works. When you first start trading we recommend you don\'t choose a high risk payment method. Transfer with specific bank can be a good starting payment method, especially if there are few traders active in your country. A few sections down is more information about different payment methods and their risk level.\n\n \n\nIf you have a new account with no previous trading history, we recommend you start by replying to existing advertisements in order to buy and sell some Bitcoins. This will help you get a hang of how trading works and it will let you build some trading history which will make your account trustworthy which in turn gives your advertisements better placement in the listings.\n\nBefore you start trading\n\nBefore you start trading make sure you familiarise yourself with your local legislation and that your are in compliance with any relevant laws and that you have the necessary business licenses for the jurisdiction you’re trading in.\n\nLegislation varies a lot from country to country and whether your trading as an individual or as a business.\n\n Get some trading experience, with a new account as it will be hard to find users to reply to your advertisements. Start out by contacting other traders ads to buy and sell, this help you get your first feedbacks and trade completions. The more trades and feedback you have, the more trustworthy you are.\n\nVerify your account by completing both the SMS verification and ID verification. A verified account is more trustworthy for buyers and will help you get more customers.\n\nResearch the payment method you\'re going to offer. Read through other traders ads of the same payment method and make some trades with them. Try to identify possible problems before you start trading. We recommend you start trading using a low risk payment method, see more about payment methods below.\n\nUse payment accounts only for Bitcoin trading. Some payment providers will temporarily or permanently close your account if you receive unauthorized payments that are related to fraud. Using accounts only for Bitcoin trading protects your personal finances.'),

                  TextSpan(
                      text: '\n\nHow to stay safe while trading Bitcoin\n',
                      style: text7),
                  TextSpan(
                      text:
                          '\n It\'s important to having good digital security, but it\'s especially important when you\'re trading Bitcoins. When you have advertisements up selling Bitcoin you also tell the world that you have Bitcoins, which can make you an attractive target to cyber criminals if you don\'t have your security in check.\n\n \n\nMost common attacks are done using spear phishing techniques. That\'s where the attackers will first attempt to get access to other services that you use, mainly your e-mail or cell phone account. From there they will try to get access to your financial services. This is why it\'s very important to keep all of your online accounts secure, not just your AsianBitcoins account. \n\nBy following these steps you can be sure that your account is protected from most security threats.\n\nEnable Two-Factor authentication on your AsianBitcoins account, this adds a second layer of security in case your password falls into the wrong hands. Make sure not to store the backup code electronically, write and store that code safely. Enable it from your security settings.\n\nEnable Login Guard from the security settings of your account to prevent logins to your account without an email confirmation. This is not enabled by default for older accounts, please make sure it is turned on.\n\nEnable Two-Factor authentication on services that support it, Google, Facebook, Dropbox all support it.\n\nBe wary of any images, links and other files that customers or unknown people send you, it can be an attempt to infect your computer with malware or worse. Run periodic malware and anti-virus checks on your computer.\n\nUse a separate email account for customer correspondence. Don\'t give this address out to your customers, use a different e-mail address for AsianBitcoins account which is not used for anything else,. Gmail accounts are good as can be protected  with two-factor authentication.\n\nReview your login history & authorized browsers. From the account security settings you can view your account Login history and authorized browsers. It\'s a good habit to check these from time to time.\n\nDon\'t use the same password on more than one site, instead use unique and randomly generated passwords. A password manager, like KeePass, allows you to do this without having to remember all your passwords. Using the same password on more than one site very dangerous, it can allow an attacker to get access to many of your accounts by knowing only one password.\n\nEducate yourself on cyber security. Having knowledge is probably the best defence, read up on common attack techniques such as spear phishing to know how to identify potential attacks.\n\nVerify the buyer\n\nIf you are selling Bitcoins for a payment method that is reversible you should verify that it is the buyer who is making the payment with his own account.\n\n \n\nOn  receiving a new trade, you first need to take a look at the buyer\'s AsianBitcoins profile to see the reputation of the buyer. Go through the buyer\'s previous feedback and his trading history.\n\n \n\nOn the page for the trade itself you will see a box showing security information of your buyer. Always view that given information to get a picture of who your trading partner is, check whether the real name of his account matches the name attached to his payment. Check that the users IP address is from the same country as the payment is coming from.\n\nEnable first time buyer limits\n\nA large part of fraud occurs from new accounts. Setting first time buyer limits on your advertisement helps you limit the risk you expose yourself to and any potential damage from fraudulent buys. They prevent a no-reputation buyer sending high volume trade requests. Setting the limits itself discourages the fraudulent buyers to contact you.\n\nReversible payments\n\nMost of online payment methods are reversible. The payment provider can take back a payment even after it has arrived to your account. For example, PayPal payments are reversible up to 180 days.\n\n \n\nIn many countries, online banking is not protected by two-factor authentication. This means that whoever gains the control of user computer, using malware or otherwise hijacked computer, can do unauthorized bank transfers. This is an issue for SWIFT, SEPA and wire transfers. Receiving money from a stolen source may lead to freezing your bank accounts for the duration of criminal investigation. \n\nCharacteristics of fraudulent activity\n\nScammers take advantage of the fact that Bitcoin transactions are irreversible or they try to trick you into releasing Bitcoins without sending payment. That\'s why it is important to never release Bitcoins from escrow until you have payment. Even if it\'s a regular buyer and someone you know, as once the Bitcoins have been released from escrow, there is no way for you to get them back.\n\n \n\nWith reversible payments, scammers will attempt to pay using stolen credentials or purchase proof. Requiring the buyer to have ID verified their AsianBitcoins account, always checking that the users real name matches that of the payment information helps you stop these attempts.\n\n \n\nIn case you encounter a suspicious user you can always open a dispute for the trade and AsianBitcoins support will help you ensure a safe trade.\n\nQuick tips on identifying scammers\n\nAsianBitcoins.io shall be bookmarked  in your browser and always use that bookmark when visiting the website. This helps you avoid accidentally visiting phishing websites, they exist and can be very convincing. Even experienced traders have fallen victim to phishing websites.\n\nFraudulent buyers are often in a hurry. The more a customer asks you to hurry/rush the more suspicious you should be, real customers always have patience.\n\nFraudulent buyers often suggest doing all or part of the transaction outside escrow and then do not complete their part of the transaction.\n\nBe careful about photoshopped payment evidence, don\'t release Bitcoins until you have confirmed that you have received the money. You are not obliged to release a trade until you can verify that you have received the buyer\'s payment.\n\nDon\'t open any links that your trading partner is sending to you. If you must, use different browser than the one you are using.\n\nDon\'t visit websites other than AsianBitcoins.com with the browser that you\'re using to trade. Use a different browser for other websites.\n\nIf you\'re unsure about a user, you can always contact support for help.\n\nTrading safe as a buyer\n\nYou can ensure the best BTC buying experience following the tips below:\n\nKeep an eye on the payment time window to make sure that you complete payment and mark trade as paid before it expires\n\nNever use external communication for trade sensitive information (e.g. receiving payment details)\n\nNever press the cancel trade button if trade is paid. In case of a disagreement with the seller, dispute the trade.\n\nCheck that the seller’s payment account details are compatible with their LocalBitcoins’ verified name\n\nUpload your payment evidence to the trade chat whenever possible\n\n'),

                  TextSpan(text: '\n\nDisputes\n', style: text7),
                  TextSpan(
                      text:
                          '\n \n\nPlease also read our terms of service.\n\nAsianBitcoins.io support handles disputes based on evidence supplied by trade participants and their reputation.\n\nNote that Disputes can start 1 hour after payment is marked complete.\n\nIf the buyer has fewer than 3 completed trades, the seller may open a dispute after 1 hour.\n\nAfter the escrow has been released by the seller the trade is considered finished by AsianBitcoins.com and cannot be disputed.\n\nWhen a Bitcoin seller is unresponsive, LocalBitcoins will release the Bitcoin to the buyer if the buyer can provide valid proof of payment.\n\nIf the buyer is unresponsive after starting a trade, the escrow will be released to the seller by AsianBitcoins support.\n\nAsianBitcoins wishes you happy trading'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
