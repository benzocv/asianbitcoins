import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
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
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/setwalletaddress.php?email=' +
          email +
          '&key=anu5781');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
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

class PrivacyPolicy extends StatefulWidget {
  static const sid = 'privacy_policy';

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String value;

  double lastcontainerheight;

  String email = '';
  String pass = '';
  String name = '';
  ScrollController controller;

  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    pass = args.pass;
    name = args.name;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
      // email=args.email;
      fetchPost2();
      //  print(MediaQuery.of(context).size);
    });
  }

  @override
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
      Navigator.pushNamed(context, EmailVerification.sid,
          arguments: Signups1Credentials(name, pass, email));
    } else {
      _onBasicAlertPressed1(context);
    }
  }

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
            'Privacy Policy',
            style: text4,
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, right: 16, left: 16, bottom: 16),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: text10,
                  children: <TextSpan>[
                    TextSpan(text: '1. Introduction\n', style: text7),
                    TextSpan(
                        text:
                            '\n 1.1 AsianBitcoins are committed to safeguarding the privacy of your data-subjects; in this policy we explain how your personal data we may hold, is collected, used, stored, and removed, meaning any information relating to you as an identified and your electronic communications as a natural or legal person referred to as "processing".\n\n 1.2.  This Policy only applies to information we process. It does not apply to the practices of companies that we don\'t own or control. Information on our services may contain links to third party websites, and any information you provide to those sites will be covered by any privacy policies they may have. Please be sure to read the privacy policies of any third-party sites you visit.\n\n1.3. We do not collect any personally identifiable information from children or minors under the age of 18. If you believe that a child or minor under the age of 18 has provided us with personally identifiable information, please contact our customer support.\n\n1.4. We may update this policy from time to time and will notify you of changes to this policy affecting your rights by email and/or by posting on our website at AsianBitcoins.io.'),
                    //2
                    TextSpan(
                        text: '\n\n2. Your Personal Data and How We Use It\n',
                        style: text7),
                    TextSpan(
                        text:
                            '\n 2.1. In this Section 2 we set out:\n\n• the general categories of data and types of personal data that we may process;\n• the source of that personal data;\n• the purposes for which we may process personal data; an\n• the legal bases of the processing.\n\n2.2. Personal identification informationThis information includes your username,  full name,date of birth, age, email address, telephone number, country of residence, nationality, gender, utility bills, photographs and/or home address. The source of the personal identification information is you. The personal identification information may be processed for the purposes of providing our services, communicating with you, protecting our users from illegal activity, maintaining legal and regulatory compliance and helping us to prevent, detect and investigate fraud, money laundering and/or other criminal activity or misuse of our service. The legal bases for this processing are: the performance of a contract between you and us and/or taking steps, at your request, to enter into such a contract and the legitimate interests of ours and/or those of third-parties, namely to prevent, detect and investigate fraud, criminal activity and/or other misuse of the services. In addition to this, the processing of personal data is necessary for compliance with the legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws.\n\n2.3. Formal identification informationFormal identification information may include your full name, nationality, date of birth, gender, social security number, tax ID number, passport details, driver’s license details and/or national identity card details. The source of the formal identification information is you. The purpose of the formal identification information is to protect our users from illegal activity, maintain legal and regulatory compliance and help us to prevent, detect and investigate fraud, money laundering and/or other criminal activity or misuse of our service. We must verify the identity of our permanent customers using our services and verify the identity of our users in certain other situations in order to comply with anti-money laundering and anti-terrorist financing laws. Moreover, processing formal identification information will help us to provide a more trustworthy, safe and reliable trading experience for our customers. Legal bases for this processing are compliance with the legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws and the legitimate interests of ours and/or those of third-parties, namely to prevent, detect and investigate fraud, criminal activity or other misuse of the services.\n\n2.4. Company informationCompany information may include information and documentation related to the name, industry, ownership, registration, country of incorporation, business address and financial information of the company. Company information may also contain personal identification information and formal identification information related to the company account holder, possible subaccount holders, beneficial owners and/or members of the board of directors of the company. The sources of the company information are the company account holder, possible subaccount holders, beneficial owners and/or members of the board of directors of the company. The company information may be processed for the purposes of providing our services, ensuring the security of our users and services, communicating with you and to protect our users from illegal activity, maintaining legal and regulatory compliance and to help us to prevent, detect and investigate fraud, money laundering and/or other criminal activity or misuse of our service. The legal bases for this processing are: the legitimate interests on our part and/or by third-parties, namely to provide our services, and to prevent, detect and investigate fraud, criminal activity or other misuse of the services. In addition to this, the processing of personal data is necessary for compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws.\n\n2.5. Financial and Employment informationFinancial information may include information related to your income, wealth, bank account information and/or tax identification. Employment information may include information and documentation related to your office location, job title, and/or description of role. The source of the financial and employment information is you. The financial and employment information may be processed for the purposes of protecting our users from illegal activity, maintaining legal and regulatory compliance and for helping us to prevent, detect and investigate fraud, money laundering and/or other criminal activity or misuse of our service. The legal bases for this processing are legitimate interests on our part and/or by third-parties, namely to prevent, detect and investigate fraud, criminal activity or other misuse of the services and compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws.\n\n2.6. We may process data about your use of our website and services ("usage information"). Usage information is primarily non-personally-identifying information of the sort that web browsers, servers, and services like Google Analytics typically make available, such as the browser type, language preference, referring site, and the time of each visit. Other non-identifying information that we might have access to includes how you use the service (e.g. search queries), your approximate location, cookies set by our site, etc. Although usage information is primarily non-personally-identifying information, you can sometimes be recognized from it, either alone or when combined or linked with personal identification information. Usage data may include: 1) Data that we collect mainly for behaviour statistics, business intelligence and email campaigns ("analytics information"). We gather website traffic data with the help of Google Analytics. We gather event based tracking data with the help of Mixpanel, and this data may also contain your email address, IP address and country code. 2) Data that we collect mainly for technical, security, fraud prevention and/or for error tracking reasons ("technical information"). We gather data on website errors with the help of Sentry which may occasionally contain usage data. We also log certain events from your actions on our site. The legal bases for this processing are the legitimate interests of ours and/or by third-parties, namely to monitor service quality and improve our website and services as well as to prevent, detect and investigate fraud, criminal activity or other misuse of the services and to prevent security issues. In addition to this, the processing of personal data is necessary for compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws.\n\n2.7. We may process data relating to the trades that you conduct through our website ("trade information"). The trade information may include trade ID, initiated trades, payment method, advertisement information, buyer username, seller username, trade value (in fiat), trade value (in bitcoin), bitcoin price, currency, timestamps of trade and trade chats. The source of the trade information is you and/or your trading partner. The legal bases for this processing are: the performance of a contract between you and us and compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws and legitimate interests of ours and/or by third-parties, namely to prevent, detect and investigate fraud, criminal activity or other misuse of the services.\n\n2.8. We may process data relating to bitcoin transactions in and out of your bitcoin wallet ("bitcoin transaction information"). Information stored on received transactions may include timestamp, bitcoin amount, deposit address, transaction ID and other publicly available data from the bitcoin blockchain. Withdrawal transactions may include data such as timestamp, bitcoin amount, sent address, transaction ID, and description. The source of the bitcoin transaction information is you and/or your trading partner. The legal bases for this processing are: the performance of a contract between you and us and compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws and legitimate interests of ours and/or by third-parties, namely to prevent, detect and investigate fraud, criminal activity or other misuse of the services.\n\n2.9. We may process information contained in or relating to any communication (including any electronic communications) that you send to us or that you generate through the use of our service ("communication information"). Communication information includes 1) all your messages, requests and other communication with our customer support which may happen during the dispute review process or via support tickets, emails, or by means of any other communication tool; and 2) all your communication and file attachments that you generate when conducting trades with other users ("trade chat messages") or other data that you generate mainly by communicating to other users. AsianBitcoins is a party to such communications, including but not limited to the trade chat messages, which AsianBitcoins necessarily must be able to review and process in order to provide its services to you (including but not limited to dispute review and dispute resolution). As a party to such communications AsianBitcoins may review and otherwise process any contents and metadata of messages comprised in the communication information. Communication information may include, email address, username, IP address, full name, audio and video files as well as photo of the user’s personal ID, photo of the user, and photo of the user’s utility bill or related documents. The source of the communication information is you and/or your trading partner. The communication information may be processed for the purposes of communicating with you, record-keeping, in order to review and resolve disputes, serve our customers better and improve our service. The legal basis for this processing is our legitimate interests, namely the proper administration of our website and business, and compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws.\n\n2.10. We may process information that you provide to us for the purpose of subscribing to our email notifications, SMS notifications and/or newsletters ("notification information"). The notification information may include your email address, phone number, username and full name. The notification information may be processed for the purposes of sending you the relevant notifications and/or newsletters. The legal basis for this processing is your consent (when required by law), the performance of a contract between you and us and our legitimate interest to communicate with our customers and to perform direct marketing where allowed by law without consent. You can unsubscribe at any point by contacting us or by clicking the unsubscribe link in an email sent by us.\n\n2.11. In connection with the activities described above, we may conduct profiling based on your interactions with and content that you provide to our service, and/or information obtained from external services (described in Section 4). In limited cases, automated processes may restrict or suspend access to our service if such processes detect activity that we think might be illegal or pose a safety or other risk to our service, our users or third parties. We process this information given the legal obligations that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws and/or complying with other applicable laws, and due to legitimate interests in protecting our service: preventing, detecting and investigating fraud, criminal activity or other misuse of the services as well as optimizing the products and services offered.\n\n2.12. We may process any of your personal data when necessary for the establishment, exercise or defence of legal claims, whether in court proceedings or outside the court procedure. The legal basis for this processing is our legitimate interests, namely the protection and assertion of our legal rights, your legal rights and the legal rights of others.\n\n2.13. In addition to the categories of personal data and purposes for which we may process your personal data set out in this Section 2, we may also in certain situations require and process information that may contain personal data where such processing is necessary for compliance with a legal obligation to which we are subject, or in order to protect your vital interests or the vital interests of another natural person. Further, your personal identification information and other personal data may be processed for the purposes of preventing, detecting and investigating money laundering or terrorist financing, as well as for prosecution of money laundering or terrorist financing or any such crimes from which assets or criminal benefits used in connection with money laundering or terrorist financing have been gained.\n\n2.14. All the aforementioned general categories of data may contain data that by itself does not identify you and is therefore not deemed as personal data.\n\n2.15. Please try to avoid supplying any unnecessary personal data to us.'),

                    //3
                    TextSpan(
                        text:
                            '\n\n3. Information You Choose to Display Publicly on Our Services\n',
                        style: text7),
                    TextSpan(
                        text:
                            '\n 3.1. Some users may elect to publicly post personally identifying or sensitive information about themselves in their normal use of our services. This could occur through the use of optional profile fields, in interactions on public boards, or if a previously private interaction is made public. Information like that, which is voluntarily posted in publicly visible parts of our services, is considered to be public, even if it would otherwise be considered to be personally identifying or sensitive. We may process such information posted by you for the performance of a contract between you and us and the legitimate interests of ours and/or those of third-parties, namely to provide our services, to prevent, detect and investigate fraud, criminal activity and/or other misuse of the services and compliance with a legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws. Additionally, voluntarily publicizing such information means that you lose any privacy rights you might normally have with regards to that information. It may also increase your chances of receiving unwanted communications, like spam.\n\n3.2. Please also remember that if you choose to provide personally identifiable information using certain public features of our services, individuals reading such information may use or disclose it to other individuals or entities without our control and without your knowledge, and search engines may index that information. We therefore urge you to think carefully about including any specific information you may deem private in content that you create or information that you submit through our services.'),

                    //4
                    TextSpan(
                        text: '\n\n4. Providing Your Personal Data to Others\n',
                        style: text7),
                    TextSpan(
                        text:
                            '\n 4.1. In this Section 4 we set out:\n\n• External services ("processors") that we use for processing personal data on our behalf;\n• Types of personal data that processors may process;\n• The reason for using them.\n\n4.2. For verifying the identity of our users, we use the document ID verification and facial biometrics technology by Onfido Ltd. ("Onfido"), a company located in the United Kingdom. The information that Onfido collects may include your full name, nationality, date of birth, gender, social security number, tax ID number, passport details, driver’s license details and/or national identity card details. Additionally, the information that Onfido collects may contain a photograph of you and/or a video in order to perform a facial check. Legal bases for processing of biometric data for verifying the identity of our users are compliance with the legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws and when such processing is necessary for the establishment, exercise or defense of our legal claims.\n\n4.3. For verifying the identity of our users, we also use the ID verification, document verification and facial biometrics technology by Jumio Inc. ("Jumio"), a company located in the United States. The information that Jumio collects may include your full name, nationality, date of birth, gender, home address, social security number, tax ID number, passport details, driver’s license details and/or national identity card details. Additionally, the information that Jumio collects may contain a photograph of you and/or a video in order to perform a facial check. Legal bases for processing of biometric data for verifying the identity of our users are compliance with the legal obligation that AsianBitcoins is subject to, namely in order to comply with anti-money laundering and anti-terrorist financing laws and when such processing is necessary for the establishment, exercise or defense of our legal claims.\n\n4.4. For behaviour statistics, business intelligence and email campaigns we use the service by Mixpanel Inc ("Mixpanel"), a company located in the United States and for behaviour statistics and business intelligence also the service by Google LLC ("Google Analytics"), a company located in the United States. Data that we may provide to Mixpanel may include your email address, IP address and country code and that data is used by Mixpanel to generate information about your usage of our service. Data that we may provide to Google Analytics may include your IP address and that data is used by Google Analytics to generate information about your usage of our service.\n\n4.5. For tracking server errors, we use the service by Functional Software Inc ("Sentry"), a company located in the United States. Error messages are rare but they may include your IP address. Sentry is used for monitoring and fixing errors and crashes.\n\n4.6. For processing notification information, we use the service by SendGrid Inc ("SendGrid"), a company located in the United States for delivering emails to users, and we may use the services by Nexmo Inc (located in the United States), Twilio Inc. (located in the United States) and TM4B Ltd. (located in the United Kingdom) for delivering SMS messages to users.\n\n4.7. In addition to the specific disclosures of personal data set out in this Section 4, we may also disclose your personal data 1) to our auditors, lawyers, accountants, consultants and other professional advisors insofar as it is reasonably necessary for the purposes of obtaining professional advice or managing legal disputes and risks; 2) to external services or authorities when such disclosure is necessary for compliance with a legal obligation to which we are subject, or in order to protect your vital interests and/or the vital interests of a third-party.'),

                    //5
                    TextSpan(
                        text:
                            '\n\n5. International Transfers of Your Personal Data\n',
                        style: text7),
                    TextSpan(
                        text:
                            '\n 5.1. We store your information primarily within the European Economic Area. However, some features and requirements of the service, involve transferring your information to third-party service providers outside the European Economic Area. We have described all those service providers above in Section 4. Where such service providers are not established in a country ensuring an adequate level of protection within the meaning of Regulation (EU) 2016/679, such as the United States, the transfers will be covered by the standard data protection clauses adopted by the European Commission or by another appropriate safeguard mechanism such as the Privacy Shield Framework.'),

                    //6
                    TextSpan(
                        text: '\n\n6. Retaining and Deleting Personal Data\n',
                        style: text7),
                    TextSpan(
                        text:
                            '\n 6.1. This Section 6 sets out our data retention and deletion policies, which are designed to help ensure that we comply with our legal obligations in relation to the user’s right to be forgotten.\n\n6.2. Personal data that we process for any purpose or purposes shall not be kept for longer than is necessary for that purpose or those purposes.\n\n6.3. Users may request the deletion of their account through our site.\n\n6.4. We will retain and delete your personal data as follows:\n\n• For all users who have deleted their account:\n\t• Personally-identifiable analytics data is removed 14 days after account deletion.\n\t•  Notification data is not generally stored by our processors but they may retain activity logs for a short period of time (this time varies depending on the processor in question but is not greater than 13 months).\n\n•For users who have not conducted or initiated any trades or bitcoin transactions to their wallet, we will delete all personal data 14 days after the approval of your account deletion request.For users who have conducted or initiated any trades or sent or received any bitcoin transactions using their wallet and whose account deletion request has been approved by us, our data deletion policy is the following:\n\t• Your public profile and advertisements will be hidden 14 days after you delete your account.\n\t• Your personal identification information, formal identification information, company information, financial and employment information, trade information, technical information and communication information will be deleted 5 years after you delete your account.\n\t• Bitcoin transaction information from our internal systems will be removed 5 years after you delete your account, with the exception of publicly available information on the Bitcoin blockchain.\n\n 6.5. In some cases it is not possible for us to specify in advance the periods for which your personal data will be retained. In such cases, we will determine the period of retention based on the period we need to access the data for the provision of services, receiving payment, resolving your customer support issue or other issues or for any other auditing or legal reasons.\n\n 6.6. Notwithstanding the other provisions of this Section 6, we may retain your personal data where such retention is necessary for compliance with a legal obligation to which we are subject to, or in order to protect your vital interests or the vital interests of another natural person.'),

                    //7
                    TextSpan(text: '\n\n7. Your Rights\n', style: text7),
                    TextSpan(
                        text:
                            '\n 7.1. In this Section 7, we have summarised the principal rights that you have under data protection law. Some of the rights are complex, might contain restrictions depending on the legal basis for processing the data and, to keep this policy as concise and easily accessible as possible, not all of the details have been included in our summaries. Accordingly, you should read the relevant laws and guidance from the regulatory authorities for further details of these rights.\n\n7.2. Your principal rights under the data protection law are:\n\n(a) the right to access;You have the right to confirmation as to whether or not we process your personal data and, where we do, to access the personal data. Providing that the rights and freedoms of others are not affected, we will supply to you a copy of your personal data. The first copy will be provided free of charge, but additional copies may be subject to a reasonable fee. You can view and export your personal data under your account settings page.\n\n(b) the right to rectification;You have the right to have any inaccurate personal data about you rectified and, taking into account the purposes of the processing, to have any incomplete personal data about you completed. You can correct or update some of your personal data yourself through your user account.\n\n(c) the right to erasure;You have the right to the erasure of your personal data. We have described our policy for retaining and deleting personal data above in Section 6.\n\n(d) the right to object to processing;You have the right to object to our processing of your personal data on grounds relating to your particular situation, but only to the extent that the legal basis for the processing is not that the processing is necessary for the performance of a task carried out in the public interest or in the exercise of any official authority vested in us; or for the purposes of the legal obligations arising from the anti-money laundering and anti-terrorist financing laws or due to legitimate interests of ours and/or those of third-parties. If you make such an objection, we will cease to process the personal information unless we can demonstrate compelling legitimate grounds for the processing which override your interests, rights and freedoms, or the processing is for the establishment, exercise or defence of legal claims.\n\n(e) the right to data portability;To the extent that the legal basis for our processing of your personal data is consent or contract, and such processing is carried out by automated means, you have the right to receive your personal data from us in a structured, commonly used and machine-readable format. However, this right does not apply where it would adversely affect the rights and freedoms of others.\n\n(f) the right to complain to a supervisory authority;If you consider that our processing of your personal information infringes data protection laws, you have a legal right to lodge a complaint with a supervisory authority responsible for data protection. You may do so in the EU member state of your habitual residence, your place of work or the place of the alleged infringement.\n\n(g) the right to withdraw consent.To the extent that the legal basis for our processing of your personal information is consent, you have the right to withdraw that consent at any time. Withdrawal will not affect the lawfulness of processing before the withdrawal.\n\n7.3. Without prejudice to the aforementioned, if we have reasonable doubts concerning the identity of a user exercising his/her rights referred to in Section 7.2 or if we otherwise deem it necessary due to security reasons, we may request the provision of additional information and otherwise use all reasonable measures necessary to confirm the identity of the user.\n\n7.4. You may exercise any of your rights in relation to your personal data by contacting our customer support. Concerning "Right to erasure" users are also able to request the deletion of their account through our site. Further, you can also remove some of your personal data yourself through your user account.'),

                    //8
                    TextSpan(text: '\n\n8. Cookie Policy\n', style: text7),
                    TextSpan(
                        text:
                            '\n (a) What are cookies\n\nAs is common practice with almost all professional websites, this site uses cookies, which are tiny files that are saved to your web browser, to improve your experience and to enable certain features, such as authentication. This page describes what information they gather, how we use it and why we sometimes need to store these cookies. We will also share how you can prevent these cookies from being stored, however this may downgrade or \'break\' certain elements of the site’s functionality.\n\nCookies may be either "persistent" cookies or "session" cookies: a persistent cookie will be stored by a web browser and will remain valid until its set expiry date, unless deleted by the user before the expiry date; a session cookie, on the other hand, will expire at the end of the user session, when the web browser is closed.\n\nCookies do not typically contain any information that personally identifies a user, but personal information that we store about you may be linked to the information stored in and obtained from cookies.\n\nFor more general information on cookies, see the Wikipedia article on HTTP Cookies.\n\n(b) Cookies that we use\n\nIf you create an account with us then we will use cookies for the management of the signup process, for general administration and for preventing abuse and misuse of our services.\n\nWe use cookies when you are logged in so that we can remember this fact. This prevents you from having to log in every single time you visit a new page. These cookies are typically removed or cleared when you log out to ensure that you can only access restricted features and areas when logged in.\n\nWhen you submit data through a form such as those found on contact pages or comment forms, cookies may be set to remember your user details for future correspondence. In order to provide you with a great experience on this site, we provide the functionality to set your preferences for how this site runs when you use it. In order to remember your preferences, we need to set cookies so that this information can be called whenever you interact with a page that is affected by your preferences.\n\nWe run an affiliate program and as a part of it affiliates advertise our site and services. With the affiliate program we use tracking cookies to track users who visit our site through one of our affiliate partner sites in order to credit them appropriately, and where applicable, allow our affiliate partners to provide you any bonus for making a purchase.\n\n(c) Cookies used by our service providers\n\nWe use Google Analytics to analyse the use of our website. Google Analytics gathers information about website use by means of cookies. The information gathered relating to our website is used to create reports about the use of our website and how we might improve your experience. These cookies may track things such as how long you spend on the site and the pages that you visit. Google\'s privacy policy is available at: https://www.google.com/policies/privacy/. To opt out of being tracked by Google Analytics, please click here: https://tools.google.com/dlpage/gaoptout.\n\nIn addition, Cloudflare will add a security cookie to any domain or subdomain that is being proxied by our service.\n\n(d) Managing cookies\n\nYou can prevent the setting of cookies by adjusting the settings on your browser (see your browser Help for how to do this). Disabling cookies may result in some functionality and features of this site being disabled.'),

                    //9
                    TextSpan(text: '\n\n9. How to Contact Us\n', style: text7),
                    TextSpan(text: '\n Visit support for more information.'),
                    TextSpan(
                        text:
                            '\n \n By clicking on NEXT button you agree to all our privacy policy.'),
                  ],
                ),
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
            desc: "Make sure you have read complete privacy policy")
        .show();
  }
}
