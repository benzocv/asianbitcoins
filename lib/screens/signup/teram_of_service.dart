import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/screens/signup/privacy_policy.dart';
import 'package:asianbitcoins/screens/signup/signup_screeen_one.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: missing_return
Future<Post> fetchPost(String name, String email, String pass, context) async {
  // BuildContext context;
  _onBasicAlertPressed(context) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreenOne.sid);
                  })
            ],
            title: "Signup Failed",
            desc: "Email Id already registered")
        .show();
  }

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/signup.php?email=' +
          email +
          '&pass=' +
          pass +
          '&key=anu5781' +
          '&name=' +
          name);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    Map<String, dynamic> value = json.decode(response.body);
    if (value["message"] == "0") {
      _onBasicAlertPressed(context);
    } else {
      return Post.fromJson(json.decode(response.body));
    }
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  String message;
  // String id;
//  final String title;
//  final String body;

  Post({this.message});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

class TermOfService extends StatefulWidget {
  static const sid = 'term_of_service';

  @override
  _TermOfServiceState createState() => _TermOfServiceState();
}

addStringToSF(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

class _TermOfServiceState extends State<TermOfService> {
  String value;
  String email = '';
  String pass = '';
  String name = '';
  double lastcontainerheight;
  Future<Post> post;
  // ignore: must_call_super
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
      // email=args.email;
      //   final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
      // email=args.email;
      pass = args.pass;
      name = args.name;
      //  String email='anusa@gmail.com';
      //  String pass='anu5781';
      post = fetchPost(name, email, pass, context);
      //  print(MediaQuery.of(context).size);
    });
    addStringToSF(email);
  }

  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    //  print(controller.position.extentAfter);

    if (controller.position.pixels == controller.position.maxScrollExtent) {
//      Navigator.pushNamed(context, EmailVerification.sid,
//          arguments: Signups1Credentials(name, pass, email));
    }
  }

  void _scrollListeners() {
    //  print(controller.position.extentAfter);

    if (controller.position.pixels == controller.position.maxScrollExtent) {
      Navigator.pushNamed(context, PrivacyPolicy.sid,
          arguments: Signups1Credentials(name, pass, email));
    } else {
      _onBasicAlertPressed1(context);
    }
  }

  /* void didChangeDependencies() {
    super.didChangeDependencies();

  } */
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    lastcontainerheight = height - 545 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }

    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
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
                    'Terms Of Services',
                    style: text4,
                  ),
                ),
                body: SingleChildScrollView(
                  controller: controller,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, right: 16, left: 16, bottom: 16),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: text10,
                        children: <TextSpan>[
                          //welcome
                          TextSpan(
                              text: 'Welcome to AsianBitcoins.org\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n Please read through these Terms of Service and our Privacy Policy carefully before start using the services. Privacy Policy includes our Cookie Policy.\n\nAsianBitcoins is an online trading service ("service" or "services") for buying and selling bitcoins. As part of its services AsianBitcoins also helps resolving disputes if such should arise between buyers and sellers. AsianBitcoins does not become party to any trade or transaction concluded by its users. Users may be natural persons or legal entities.\n\nThese Terms of Service govern the use of the services and the relationship between the user and AsianBitcoins Oy, a Finnish limited liability company with business ID 2855415-2 and having its registered office and principle place of business at MAK\'s Technology LTD 20-22, Wenlock Road, London, England, N1 7GU ("AsianBitcoins" or "we").\n\nIf you are a consumer domiciled in the European Economic Area, all mandatory statutory consumer protection laws and regulations applicable in the country of the consumers\' residence apply, to the extent that those laws and regulations provide a more extensive protection than the protection set out in these Terms of Service.\n\nAsianBitcoins is registered with and operates under the supervision of the Financial Supervisory Authority of India.'),

                          //acceptance
                          TextSpan(
                              text: '\n\nAcceptance of the Terms\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n Before using any of our services, you must first agree to these Terms of Service and the Privacy Policy. By accessing our services or by otherwise using them, you confirm that you agree to these Terms of Service and agree to be bound by them ("Agreement"). You also agree that your personal data and electronic communications on our platform will be processed in accordance with our Privacy Policy, which are incorporated here by reference.\n\n   Minors are not allowed to use the services. You affirm that you are at least eighteen (18) years of age, or the age of legal majority in your jurisdiction if that is higher than eighteen (18) years of age.\n\nYou affirm that you have the right, power, capacity and authority to lawfully enter into this Agreement.'),

                          //change of term
                          TextSpan(text: '\n\nChange of Terms\n', style: text7),
                          TextSpan(
                              text:
                                  '\n We have the right, at our sole discretion, to make modifications and revisions to the terms of this Agreement to reflect changes in technology, standards, legislation, administrative or business practices, or the costs structure for providing the services. Such modifications and revisions will be notified to you through the service no later than thirty (30) days before they become effective.\n\nYou will be deemed to have accepted all modifications and revisions by continuing to use the service. If you do not agree to the changes, you can terminate this Agreement at any time by concluding any outstanding trades and other obligations, withdrawing any remaining balances and closing down your account.\n\nWe also have the right, at our sole discretion, to make modifications and revisions to the services and to the terms of this Agreement at any time which are due to security or compliance reasons, or for reasons suspected fraudulent activity. Such modifications will be published on our site and notified to you without undue delay.'),

                          //registration
                          TextSpan(
                              text: '\n\nRegistration and User Account\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n To use our services, you must first register with us by creating a user account ("User Account" or "account"). An account will only be issued once you have provided all necessary information required for by us for registration and the information has been examined according to the applicable legal requirements placed upon us by the authorities. This examination and requirements include, but are not limited to, anti-money laundering and counter-terrorism regulations as well as, in the case of company accounts, the examination of the details of your business, including the beneficial owners. All the information that we request you to provide in connection with the registration must be true, accurate and complete. If we believe that the information is not true, accurate or complete, we have the right to refuse your access to the site, or any of its resources, and to deny, terminate or suspend your account.\n\n A person may only have one account at the time (except in the case of legal entities). You may not use the services or create an account on behalf of someone other than yourself. You may not act as an intermediary or broker. You are not allowed to sell, borrow, share or otherwise make available your account or any detail necessary to access your account to ANYONE other than yourself.\n\nYou are responsible for maintaining adequate security and control of your username, password, authentication code or any other code or credential that you use to access the services.\n\nYou must not provide any misleading or fraudulent information, including, but not limited to having a non-personal phone number. Creating fake reputation information for your account, faking your country of origin or providing fraudulent identification documents is prohibited and will lead to termination or suspension of your account.\n\nYou have the right to delete your account and to terminate this Agreement at any time. You are responsible for all the obligations which have arisen up until the termination.\n\nCompany accounts\n\nIf you wish to use our services as a legal entity you are required to register an account in the name of that entity as the main account for that entity ("company account"). When creating a company account, you confirm that you are duly authorized and have the legal capacity to execute this Agreement and that this Agreement is legally binding on such entity.\n\nAfter registration of the main company account, one or more other company sub-accounts may be registered for the same legal entity so that the company account and each sub-account is registered in the name of and operated by separate natural persons on behalf of the entity.\n\nThe same legal entity may place several advertisements on our platform, created by different company account holders, but such advertisements may not be fully overlapping (e.g. using the same trade limits with the same price in the same payment method category in the same country).'),

                          //Identity Verification
                          TextSpan(
                              text: '\n\nIdentity Verification\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n In order to ensure AsianBitcoins remains a safe platform for all of our users, and for us to comply with mandatory legal obligations which we are subjected to, we may require you to verify your identity to access the services we offer. Identity verification may be required when you create advertisements, pass certain trade volume limits, during trade disputes, fraud investigations, and to ensure account ownership. As part of our ID verification process we require you to provide us with your full name as well as documents and photographs that verify your identity (e.g. valid passport).\n\nIn certain situations (e.g. due to the regulatory or legal requirements) we may require enhanced identity verification. This may include requirements to verify details or sources of funds regarding payments you have made or received during trades on AsianBitcoins as well as bitcoin transactions that you have sent or received from your account.'),

                          //Bitcoin Trading
                          TextSpan(text: '\n\nBitcoin Trading\n', style: text7),
                          TextSpan(
                              text:
                                  '\n You can place one or more advertisements on our platform when you wish to offer to buy or sell bitcoins. We have the right to restrict the number of your advertisements for security reasons and reasons of suspected misconduct or fraudulent activity.\n\nBitcoin trades ("trade" or "contact") to either buy or sell bitcoins are initiated by responding with a trade request to advertisements created by other users. With the trade request you are making a legally binding offer and agree to be bound by the terms and conditions of the trade (such as exchange rate, bitcoin amount and terms of payment) as determined by the advertiser to whom you are sending the trade request to. When sending the trade request, you may need to select from options made available in the advertisements or accept any freeform terms and conditions set out by the advertiser in the Terms of trade field and displayed on the advertisement page. The terms and conditions of the trade must be accordance with the terms of this Agreement. In case of discrepancy, the terms of this Agreement will have precedence.\n\nWhen you are selling bitcoin it is your responsibility to check that you have received payment for the full amount, that the payment is not made by a third party to the trade, and that it was made according to your instructions given to the buyer. After you have released a trade to the buyer it is not possible to cancel, reverse, dispute or otherwise recover or return the bitcoins to you.\n\nPayments made by buyers must be sent by the same person or entity who is the holder of the account or the company account. Receiving, making, providing, or attempting to receive, make or provide payments to or from third parties is forbidden and considered a violation of this Agreement.\n\nAll communication relevant to the trade must happen in the trade chat on our platform in such a way that it is readily available for AsianBitcoins support staff to review. Consequently, communications on our platform are not considered private communications between you and other users, but AsianBitcoins is also a party to such communications, and may access and otherwise process such communications in accordance with the Privacy Policy.\n\nCommunication that has not occurred on our platform or that has been hidden, encrypted or otherwise obstructed from view is not taken into consideration during dispute review and dispute resolution.'),

                          //Disputing Bitcoin Trades
                          TextSpan(
                              text: '\n\nDisputing Bitcoin Trades\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n When a buyer and a seller are in disagreement over a trade either party or AsianBitcoins can start a dispute ("Disputed trade or "dispute") to initiate a mediation process on the bitcoin held in escrow. Disputed trades are reviewed and resolved by AsianBitcoins support staff.\n\nDisputes can only be started on trades that are open and marked as paid by the buyer but not yet released by the seller. Trades that are not marked as paid by the buyer, have been released by the seller, cancelled by the buyer, automatically cancelled, or already disputed and resolved are considered completed and cannot be disputed, reversed, or altered.\n\nUnresponsiveness\n\nWhen you have placed advertisements which have not expired or you are involved in a bitcoin trade it is important that you remain active and available at least until the trade is completed, canceled, or resolved. This means that you must be able to provide a response to a request by AsianBitcoins support in a disputed trade within twenty-four (24) hours or you may be deemed as unresponsive and the dispute may be resolved against you for this reason alone.\n\nDispute review\n\nDuring a dispute review AsianBitcoins support may give you instructions that you are required to follow. The instructions given to you may require you to provide proof of payment, proof that you have or have not received payment (e.g. bank transaction history), additional ID verification, photo; audio; or video evidence, or any other documents deemed relevant by AsianBitcoins. Failure to follow the instructions may lead to the dispute being resolved against you.\n\nDispute resolution criteria\n\nA disputed trade is most commonly resolved by AsianBitcoins support moving the escrowed bitcoin to the buyer or the seller of the disputed trade once the dispute resolution criteria are met.\n\nIn rare situations where neither party fulfill the criteria, or it is in other ways unclear or not possible to determine which party has fulfilled the dispute resolution criteria, AsianBitcoins may decide to resolve the dispute by splitting the escrowed bitcoin between the buyer and the seller evenly or unevenly.\n\nDispute resolution criteria\n\nAsianBitcoins can resolve a disputed trade in the favor of a bitcoin buyer when one of the following criteria are met:\n\nThe buyer has made payment according to the instructions provided by the seller in the trade chat, advertisement terms of trade, or advertisement payment details and the buyer has provided sufficient proof that the payment was made according to these instructions.\n\nThe seller has become unresponsive.\n\nAsianBitcoins can resolve a disputed trade in the favor of a bitcoin seller when one of the following criteria are met:\n\nThe buyer has not provided payment or not provided payment in full\n\nThe payment made by the buyer has been held/frozen/stopped by the payment provider\n\nThe buyer has not provided payment according to the instructions provided to them by the seller in the trade chat, advertisement terms of trade or advertisement payment details.\n\nThe payment is made by a third party to the trade OR the payment is made from a payment account not registered in the name of the buyer.\n\nThe buyer is not responding\n\nIf the buyer or the seller of a disputed trade provides fraudulent information or fraudulent documents or makes false claims or otherwise tries to force a certain outcome of a disputed trade the dispute may be immediately resolved against the user.\n\nIncorrect dispute resolution\n\nIf you believe AsianBitcoins has resolved a dispute you are a party of in a way which is not in accordance with these terms you have a right to request a review. To request a review you need to notify us and specifically request a review by contacting customer support no later than 120 days after the dispute resolution has been given.\n\nLimitation of Liability regarding dispute resolution\n\nYou acknowledge that the dispute resolution is a service that we provide and which will be conducted in accordance with the terms of this Agreement. You agree and accept that we assume no responsibility for the outcome thereof and in any event our liability for dispute resolution is limited to the amount of fee payable to us.\n\nIn the event of an incorrect dispute resolution which is corrected in accordance with the terms of this Agreement, we assume no liability for any damage, costs or inconvenience.'),

                          //Advertisements
                          TextSpan(text: '\n\nAdvertisements\n', style: text7),
                          TextSpan(
                              text:
                                  '\n You can create bitcoin trade advertisements ("advertisement" or "ad" or "ads") to advertise that you want to buy or sell bitcoins. Other users can send trade requests to you from the advertisements that you’ve created. When a trade request is sent to you a bitcoin trade is automatically started.\n\nAdvertisements for buying with or selling against cash are not allowed.\n\nWhen you have advertisements enabled you are required to be active and available to reply to trades started from these advertisements. If a dispute is initiated in a trade against an advertiser who is not active and available the advertiser may be deemed unresponsive within the meaning of this Agreement and the dispute may be resolved against them.\n\nInformation and payment details you provide in advertisements and trades must at all times be correct and up to date. Disputes may be resolved against you if you include out-of-date payment details and a buyer completes payment accordingly. Refusal to complete trades or to provide payment details for trades opened from your advertisements is considered a violation of this agreement.\n\nThe price or price equation that is defined in the advertisement details must contain any and all fees that the advertiser requires the buyer to pay. After initiation of a trade the price is locked and cannot be changed or any additional fees added without consent from both parties of the trade.\n\nMultiple advertisements which are fully overlapping (e.g. using the same trade limits with the same price in the same payment method category in the same country) are not allowed.'),

                          //Limitation, Suspension, and Termination of Your User Account
                          TextSpan(
                              text:
                                  '\n\nLimitation, Suspension, and Termination of Your User Account\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n Occasionally situations arise where we may need to limit, suspend, or terminate your account. Account limitation results in a temporary or permanent loss of access to a certain specific part or parts of the services we offer. Account suspension results in a temporary loss of access to most parts of the services we offer. Account termination results in permanent loss of access to all services.\n\n As a result of limitation, suspension or termination your access to and the withdrawal of bitcoins that you have in your AsianBitcoins wallet may be delayed or denied.\n\n We have the right to limit, suspend, or terminate your account or access to the services that we provide if:\n\nwe have a reason to believe that you have acted in violation of these Terms of Service or applicable laws or regulations or if we have a reason to believe that any content or material submitted or shared by you in or through the services violates these Terms of Service or applicable laws or regulations or third party rights;\n\nwe suspect that you use the services to engage in, attempt to engage in, or in connection with fraudulent activity, money laundering, terrorist financing or other financial crime;\n\nwe have not been able to verify your identity or we have reason to believe that you have supplied false, misleading or deceptive information in connection with your registration, identity verification, trades or any other use of our services, either to us or to another user;\n\nwe are required to do so under any applicable law, regulation or an order issued by an authority or court;\n\nmake available content or behave in a way that libels, defames, invades privacy, stalks, is obscene, pornographic, racist, abusive, harassing, threatening or is offensive;\n\nif you use the services in a manner which may cause the services to be interrupted or damaged or such a way that the functionality of the services is in any way impaired or attempt to bypass or break any security mechanism of the services or if AsianBitcoins believes in good faith that such action is reasonably necessary to protect the security of its services or its property or brand or the security, property and rights of its users or those of third parties;\n\nattempt any unauthorized access to user accounts or any part or component of the service.\n\nWe will give you a notice of any limitation, suspension, or termination of your account but we may, if it is reasonable to do so (for example we consider it advisable for security reasons), limit, suspend or terminate your account without prior notice to you.\n\nYou acknowledge that our decision to limit, suspend, or terminate your account, may be based on confidential criteria that are essential to our risk management and security protocols and that we are under no obligation to disclose the details of our risk management and security procedures to you unless otherwise provided by the Privacy Policy.\n\nIn the event that we limit, suspend or terminate your account we will lift the suspension as soon as possible once the reasons for the suspension or termination no longer exist.'),

                          //Fees and Pricing
                          TextSpan(
                              text: '\n\nFees and Pricing\n', style: text7),
                          TextSpan(
                              text:
                                  '\n You agree to pay the fees and charges for the use of the Services according to the price list which is available on our site. Such fees may include fees for incoming and outgoing transactions and percentage based fees for trades completed.\n\nUnless otherwise specified, you accept that fees are automatically deducted from your AsianBitcoins wallet balance or deposit at the time when the service is rendered or completed.\n\nWe reserve the right to change the fees or the principles of pricing from time to time in accordance with the terms of this Agreement.'),

                          //Supporting Blockchain Forks and Other Cryptocurrencies
                          TextSpan(
                              text:
                                  '\n\nSupporting Blockchain Forks and Other Cryptocurrencies\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n From time to time, new and alternative cryptocurrencies and/or forks of the bitcoin blockchain may be created. This may result in holders of private keys containing a bitcoin balance receiving a corresponding amount of the new cryptocurrency on the newly created blockchain (“air-drop”). We reserve the right at our sole discretion to decide if and how we support any new cryptocurrencies and/or blockchain forks in our services including defining which blockchain shall be deemed as bitcoin within the meaning of this Agreement. We strive to communicate our decisions concerning any significant new forks or cryptocurrencies on our website in a timely manner. If we decide to not support a new cryptocurrency we may, but are not obligated to, compensate users who held bitcoin in their AsianBitcoins account at the time of the air-drop in a manner deemed appropriate by us. We reserve the right to provide compensation by converting all of the available new cryptocurrency to bitcoin and sharing all of the converted bitcoin between users who held a bitcoin balance on their account at the time of the creation of the new cryptocurrency. In case such a conversion takes place we may charge you a reasonable processing fee (which shall not exceed the amount of compensation payable to you).\n\nIf we decide to support a new cryptocurrency, unless otherwise communicated by us, this Agreement, including any reference to bitcoin, shall be equally applied to the new cryptocurrency.'),

                          //Allowed Jurisdictions
                          TextSpan(
                              text:
                                  '\n\nSupporting Blockchain Forks and Other Cryptocurrencies\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n AsianBitcoins does not offer the use of its services in the Federal Republic of Germany, or the States of New York or Washington in the United States of America. You confirm that you are not a resident or governed by the laws and regulations of these jurisdictions.'),

                          //Termination of Business
                          TextSpan(
                              text: '\n\nTermination of Business\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n AsianBitcoins does not offer the use of its services in the Federal Republic of Germany, or the States of New York or Washington in the United States of America. You confirm that you are not a resident or governed by the laws and regulations of these jurisdictions.'),

                          //Intellectual Property Rights
                          TextSpan(
                              text: '\n\nIntellectual Property Rights\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\n You acknowledge and agree that all copyrights, trademarks and all other intellectual property rights in and related to this site and our services is exclusively the property of AsianBitcoins and our licensors. We grant you a revocable, non-exclusive, non-sublicensable, non-transferable and limited license, subject to the terms of this Agreement, to access and use our site and service, as well as related content, materials and information (collectively, the "Content") solely for approved purposes as permitted by us from time to time. Any other use of the Content is expressly prohibited and you agree not to copy, transmit, distribute, sell, license, reverse engineer, modify, publish, or participate in the transfer or sale of, create derivative works from, or in any other way exploit any of the Content, in whole or in part.'),

                          //Disclaimer of Warranties and Limitation of Liability
                          TextSpan(
                              text:
                                  '\n\nDisclaimer of Warranties and Limitation of Liability\n',
                              style: text7),
                          TextSpan(
                              text:
                                  '\nThis site and the services are provided on an “as is” and “as available” basis without any representation or endorsement. To the maximum extent permitted by applicable law, we make no warranties of any kind, whether express or implied, in relation to the site or the services, including but not limited to, implied warranties of fitness for a particular purpose or non-infringement, or any implied warranty arising from course of dealing or usage.\n\nAsianBitcoins is not associated with or does not itself support or claim to be in partnership with any of the payment methods, services or companies which may appear visible in the Online Payment method lists or advertisement details. Also, services provided by AsianBitcoins are not authorized, approved, endorsed or sponsored by any of the payment methods listed on the website or their respective trademark owners.\n\nAsianBitcoins is not responsible for any user-generated content on its site including but not limited to messages, feedbacks or advertisements and may remove said content without notice (unless such notice is required by applicable law) or liability at any time in its sole discretion.\n\nAsianBitcoins reserves the right to modify or discontinue, temporarily or permanently, all or any part of this site and/or any services on this site, with or without notice, and/or to establish general guidelines and limitations on their use.\n\nOur liability, and the liability of our affiliates, directors and employees, is limited to the maximum extent permitted by applicable law. In particular, we will not be liable for indirect damage.\n\nNothing in this Agreement shall exclude or limit our liability based on willful misconduct or gross negligence.\n\nNotwithstanding any other provision in this Agreement, nothing shall limit your rights as a consumer under mandatory provisions of applicable consumer protection legislation which are relevant for our services.'),

                          //General
                          TextSpan(text: '\n\nGeneral\n', style: text7),
                          TextSpan(
                              text:
                                  '\nWe may transfer or assign any of our rights and obligations arising under this Agreement to any party at any time, but this will not affect your rights or our obligations under this Agreement. You may not, however, transfer or assign any of your rights or obligations under this Agreement to any other party.\n\nThis Agreement (as amended from time to time) and any document expressly referred to in them contains the entire agreement and understanding between you and us in respect of all matters which are referred to herein and supersedes any prior written or oral agreement relating to such matters. No oral explanation or oral information given by either of us shall alter the interpretation of this Agreement. You confirm that, in agreeing to accept this Agreement, you have not relied on any representation that is not expressly included herein. However, nothing in this Agreement purports to exclude liability for any fraudulent statement or act.\n\nIf any part of provision this Agreement is deemed unlawful, void or for any reason unenforceable, then that provision shall be deemed to be severable from this Agreement and shall not affect the validity and enforceability of any of the remaining provisions of the Agreement.\n\nOur failure to enforce any right or provision in this Agreement will not constitute a waiver of such right or provision unless acknowledged and agreed to by us in writing. Except as expressly set forth in this Agreement, the exercise by either party of any of its remedies under this Agreement will be without prejudice to its other remedies under this Agreement or otherwise permitted under law.\n\nYou agree that this Agreement and any dispute between you and us arising out of or in connection with this Agreement shall be governed in all respects by the laws of India, without regard to their choice-of-law provisions. Without limitation to any statutory rights for consumers under applicable consumer protection laws, you agree that all disputes, claims and proceedings shall be resolved in the first instance by the district court of Helsinki, India. Notwithstanding the foregoing, if you are a consumer, you may also file a complaint regarding the terms of this Agreement with the Consumer Complaints Board in India (https://www.kuluttajariita.fi). Before doing so, you must first contact the Consumer Advisory Services in India (https://www.kkv.fi/kuluttajaneuvonta).\n\n'),
                          TextSpan(
                              text:
                                  '\n \n By clicking on NEXT button you agree to all our terms & conditions.'),
                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: BottomOne(
                  colour: color2,
                  text: 'Next',
                  ontap: () {
                    _scrollListeners();
                  },
                  textStyle: text5,
                ),
              ),
            );
          }
          // return Text(snapshot.data.message);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");

          //return Text("Fuck You");
        }
        return Dialog(
          child: Container(
            color: Color.fromRGBO(18, 18, 18, 1),
            child: new Row(
              //     height: 10,
              mainAxisSize: MainAxisSize.max,
              children: [
                new Container(
                  height: 70,
                  margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  /*  child: ColorLoader(
                                            colors: colors,
                                            duration: Duration(milliseconds: 1200)
                                        ),*/
                ),
                new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(62, 212, 0, 1),
                  ),
                ),
                new SizedBox(
                  width: 20,
                ),
                //     new Container(margin: EdgeInsets.fromLTRB(0,0,5,0),),
                new Text(
                  "Loading",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onBasicAlertPressed1(context) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Complete Reading",
            desc: "Make sure you have read complete Terms of Service")
        .show();
  }
}
