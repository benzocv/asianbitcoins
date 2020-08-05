import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HowToBuy extends StatefulWidget {
  static const sid = 'how_to_buy';

  @override
  _HowToBuyState createState() => _HowToBuyState();
}

class _HowToBuyState extends State<HowToBuy> {
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
            'How To Buy',
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

                  TextSpan(text: '\n\nStep 1. Sign Up\n', style: text7),
                  TextSpan(
                      text:
                          '\n The first step to start with buying your bitcoin is to sign up and create your ABC account. With Asian Bitcoins, you get a free and fully secured online bitcoin wallets by Signing Up. You don’t  need additional apps. If you already have ABC account, skip to the next step.'),

                  TextSpan(
                      text: '\n\nStep 2. Go to Buy on Dashboard\n',
                      style: text7),
                  TextSpan(
                      text:
                          '\n Go to the dashboard and click “Buy” at the bottom of the screen. Here you go. You can select your preferred advertisement as per your requirement you can fill the information'),

                  TextSpan(
                      text: '\n\nStep 3. Selecting  an advertisement\n',
                      style: text7),
                  TextSpan(
                      text:
                          '\n From the list of advertisements, choose one from a trader with a good trust score and a high amount of trades. After you press the \'Buy\' button you\'ll see more information about the advertisement, including the terms of the trade. Read through them before submitting the trade request, if you don\'t agree with them you can go back to the previous page and choose another advertisement. Make sure your currency, your location and payment methods are perfect as per your convenience.'),

                  TextSpan(
                      text: '\n\nStep 4. Chat with Seller\n', style: text7),
                  TextSpan(
                      text:
                          '\n To start the trade, type in the box how much you want to buy (here you can choose bitcoin/trade in local currency also), once you submit the request chat box will open in message box. Go to message box and start chatting with the seller. Most recent trade chat will be displayed first. '),

                  TextSpan(
                      text:
                          '\n\nStep 5. Pay the seller & Mark payment as paid\n',
                      style: text7),
                  TextSpan(
                      text:
                          '\n Be sure you\'re ready to pay when clicking the “I have paid” button, if you don\'t pay before the payment window is over, the trade will be automatically cancelled.Once you have made the payment, click the “I have paid” button. Once the trader has verified that your payment has been received your Bitcoin will be released from escrow and they are instantly available in your ABC Wallet. Now you are done!  congratulations on your first Bitcoin trade on ABC App.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
