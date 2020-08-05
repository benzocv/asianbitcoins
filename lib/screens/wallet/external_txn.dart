import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/screens/extra/delete_this.dart';
import 'package:asianbitcoins/screens/wallet/wallet_transactions.dart';
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
import 'package:asianbitcoins/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<TransactionsList> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/external_transactions.php?key=anu5781&email=' +
          email);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    // count++;
    return TransactionsList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class TransactionsList {
  final List<Post2> transactions;

  TransactionsList({
    this.transactions,
  });

  factory TransactionsList.fromJson(List<dynamic> parsedJson) {
    List<Post2> transactions = new List<Post2>();
    transactions = parsedJson.map((i) => Post2.fromJson(i)).toList();

    return TransactionsList(transactions: transactions);
  }
}

class Post2 {
  String message;
  String amount;
  String confirmations;
  String sender_address;
  String receiver_address;

  // String id;
//  final String title;
//  final String body;

  Post2(
      {this.message,
      this.amount,
      this.confirmations,
      this.sender_address,
      this.receiver_address});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
        message: json['message'],
        amount: json["amount"],
        confirmations: json["confirmations"],
        sender_address: json["sender_address"],
        receiver_address: json["receiver_address"]

        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class ExternalTransactions extends StatefulWidget {
  static const sid = 'external_transactions';

  @override
  _ExternalTransactionsState createState() => _ExternalTransactionsState();
}

class _ExternalTransactionsState extends State<ExternalTransactions> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  bool status;
  bool status2;
  Future<TransactionsList> post2;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    post2 = fetchPost2();
    //  post = fetchPost();
//    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    /* try
    {

    }
    catch(e)
    {

    } */

    //    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    // email=args.email;
    //   final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    // email=args.email;
//  String email='anusa@gmail.com';
    //  String pass='anu5781';
    //  post = fetchPost(name,email,pass);
    //  print(MediaQuery.of(context).size);

    // addStringToSF(email);
  }

  /* void didChangeDependencies() {
    super.didChangeDependencies();
    final phone_verification_data args = ModalRoute.of(context).settings.arguments;
   // final twofactor args2=ModalRoute.of(context).settings.arguments;
   // email=args.email;
   // politically_exposed=args.politically_exposed;
    //  firstname=args.firstname;
    //  lastname=args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
  /*  if(args2.email!=null) {
      post = fetchPost2(args2.password, args.email);
      status=true;

    }  */
   /* if(args2.email!=null)
      {
        post = fetchPost(args.otp, args.email);
        status=true;
      } */
    if(args.email!=null) {
      post = fetchPost(args.otp, args.email);
      status=true;
    }
  } */
  /* @override
  void initState() {
   // _future = callAsyncFetch();
    final phone_verification_data args = ModalRoute.of(context).settings.arguments;
    // final twofactor args2=ModalRoute.of(context).settings.arguments;
    // email=args.email;
    // politically_exposed=args.politically_exposed;
    //  firstname=args.firstname;
    //  lastname=args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    /*  if(args2.email!=null) {
      post = fetchPost2(args2.password, args.email);
      status=true;

    }  */
    /* if(args2.email!=null)
      {
        post = fetchPost(args.otp, args.email);
        status=true;
      } */
    if(args.email!=null) {
      post = fetchPost(args.otp, args.email);
      status=true;
    }
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 510 - 70 - 85;

    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
    }

    return FutureBuilder<TransactionsList>(
      future: post2,
      builder: (context, snapshot) {
        //   */
        if (snapshot.hasData) {
          List<Widget> list = new List();
          list.add(
            Container(
              width: width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, WalletTransactions.sid);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'Internal',
                                style: text2.copyWith(
                                  fontSize: 12.0,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: color2,
                                width: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ExternalTransactions.sid);
                            },
                            color: color1,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'External',
                                style: text2.copyWith(
                                  fontSize: 12.0,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: color2,
                                  width: 2,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          list.add(Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
            child: Row(
              children: <Widget>[
                Container(
                  width: width - 32,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'External Transactions',
                          style: text2.copyWith(
                            color: color4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));

          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              if (snapshot.data.transactions[i].receiver_address != null) {
                if (double.parse(snapshot.data.transactions[i].confirmations) <=
                    3) {
                  list.add(
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, SellTradeExplore.sid,arguments:snapshot.data.transactions[i].id );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          color: color1.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Amount (BTC)\t:\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot.data
                                                    .transactions[i].amount,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Confirmation\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot
                                                        .data
                                                        .transactions[i]
                                                        .confirmations +
                                                    '/3',
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Sender Address\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot
                                                    .data
                                                    .transactions[i]
                                                    .sender_address,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ); //whitecard
                } else {
                  list.add(
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, SellTradeExplore.sid,arguments:snapshot.data.transactions[i].id );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          color: color1.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Amount (BTC)\t:\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot.data
                                                    .transactions[i].amount,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Confirmation\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: 'Confirmed',
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Sender Address\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot
                                                    .data
                                                    .transactions[i]
                                                    .sender_address,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ); //whitecard

                }
              }
              if (snapshot.data.transactions[i].sender_address != null) {
                if (double.parse(snapshot.data.transactions[i].confirmations) <=
                    3) {
                  list.add(
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, SellTradeExplore.sid,arguments:snapshot.data.transactions[i].id );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          color: color1.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Amount (BTC)\t:\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot.data
                                                    .transactions[i].amount,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Confirmation\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot
                                                        .data
                                                        .transactions[i]
                                                        .confirmations +
                                                    '/3',
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Receiver Address\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot
                                                    .data
                                                    .transactions[i]
                                                    .receiver_address,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ); //whitecard
                } else {
                  list.add(
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, SellTradeExplore.sid,arguments:snapshot.data.transactions[i].id );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          color: color1.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Amount (BTC)\t:\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot.data
                                                    .transactions[i].amount,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Confirmation\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: 'Confirmed',
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Receiver Address\t :\t\t',
                                                style: text13,
                                              ),
                                              TextSpan(
                                                text: snapshot
                                                    .data
                                                    .transactions[i]
                                                    .receiver_address,
                                                style: text14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ); //whitecard

                }
              }
            }
          }

          return Container(
            child: Scaffold(
              drawer: SideBar(),
              backgroundColor: color3,
              appBar: AppBar(
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ChatHome.sid);
                    },
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.solidComments,
                      ),
                      tooltip: 'Show Chat',
                      onPressed: () {
                        Navigator.pushNamed(context, ChatHome.sid);
                      },
                    ),
                  ),
                ],
                iconTheme: IconThemeData(
                  color: color4,
                ),
                centerTitle: true,
                elevation: 0.0,
                title: Text(
                  'Transactions',
                  style: text4,
                ),
              ),
              body: Container(
                child: ListView(children: list),
              ),
              bottomNavigationBar: Container(
                color: color1,
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, WalletSend.sid);
                        },
                        child: Container(
                          color: color2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Back to Wallet',
                                style: text4.copyWith(color: color1),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          return Container(
            child: Scaffold(
              drawer: SideBar(),
              backgroundColor: color3,
              appBar: AppBar(
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ChatHome.sid);
                    },
                    child: ChatCount(),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.solidBell),
                    tooltip: 'Show Notifications',
                    onPressed: () {
                      Navigator.pushNamed(context, NotificationHome.sid);
                    },
                  ),
                ],
                iconTheme: IconThemeData(
                  color: color4,
                ),
                centerTitle: true,
                elevation: 0.0,
                title: Text(
                  'Incoming Txn',
                  style: text4,
                ),
              ),
              body: Container(
                child: ListView(
                  children: <Widget>[Text("Nothing Here")],
                ),
              ),
            ),
          );

          // return Text("${snapshot.error}");
          //  return Text("Fuck You");
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

        // By default, show a loading spinner.
        //     return CircularProgressIndicator();
      },
    );

//      return FutureBuilder<Post>(
//        future: post,
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            if(snapshot.data.message=="1")
//            {
//
//
//              ;}
//            // return Text(snapshot.data.id);
//          } else if (snapshot.hasError) {
//            //  return Text("${snapshot.error}");
//            return Text("Fuck You");
//          }
//
//          return Dialog(
//            child: Container(
//              color: Color.fromRGBO(18,18,18,1),
//              child: new Row(
//                //     height: 10,
//                mainAxisSize: MainAxisSize.max,
//                children:[
//                  new Container(height:70,margin: EdgeInsets.fromLTRB(8,0,0,0),
//                    /*  child: ColorLoader(
//                                            colors: colors,
//                                            duration: Duration(milliseconds: 1200)
//                                        ),*/),
//                  new CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(62, 212, 0, 1),),),
//                  new SizedBox(width: 20,),
//                  //     new Container(margin: EdgeInsets.fromLTRB(0,0,5,0),),
//                  new Text("Loading",style: TextStyle(color: Colors.white),),
//                ],
//              ),
//            ),
//          );
//
//          // By default, show a loading spinner.
//          //     return CircularProgressIndicator();
//        },
//      );
  }
}
