import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/buy/buy_trade_explore.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
import 'package:asianbitcoins/screens/login/login_screen.dart';
import 'package:asianbitcoins/screens/login/pin_enter.dart';
import 'package:asianbitcoins/screens/profile/Personal_Profile.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<TransactionsList> fetchPost2(int page_no) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  String otp = prefs.getString('otp');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/buy_coin_dashboard.php?key=anu5781&email=' +
          email +
          '&otp=' +
          otp +
          '&page=' +
          page_no.toString());
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
  String username;
  String no_of_trades;
  String completed_trade_ratio;
  String pay_method;
  String country;
  String price_per_btc;
  String min_t_limit;
  String max_t_limit;
  String currency;
  String id;
  String email;
  String samnevale_ki_id;

  // String id;
//  final String title;
//  final String body;

  Post2({
    this.message,
    this.username,
    this.no_of_trades,
    this.completed_trade_ratio,
    this.pay_method,
    this.country,
    this.price_per_btc,
    this.max_t_limit,
    this.min_t_limit,
    this.currency,
    this.id,
    this.email,
    this.samnevale_ki_id,
  });

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
      message: json['message'],
      username: json["username"],
      no_of_trades: json["no_of_trades"],
      completed_trade_ratio: json["completed_trade_ratio"],
      pay_method: json["pay_method"],
      country: json["country"],
      price_per_btc: json["price_per_btc"],
      min_t_limit: json["min_t_limit"],
      max_t_limit: json["max_t_limit"],
      currency: json["currency"],
      id: json["id"],
      email: json["email"],
      samnevale_ki_id: json["user_id"],
      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

addStringToSF(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('otp', email);
}

getStringToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("email");
}

class BuyCoinDashboard extends StatefulWidget {
  static const sid = 'buy_coin_dashboard';

  @override
  _BuyCoinDashboardState createState() => _BuyCoinDashboardState();
}

class _BuyCoinDashboardState extends State<BuyCoinDashboard> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  bool status;
  bool status2;
  String pin;
  Future<TransactionsList> post2;
  Future<TransactionsList> post3;
  // String pin;
  ScrollController controller;
  int page_no = 1;
  String email;
  @override
  void initState() {
    super.initState();
//    pin= checkpin();
    controller = new ScrollController()..addListener(_scrollListener);
    checkpin() async {
      //  final String args = ModalRoute.of(context).settings.arguments;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString("email");
      post2 = fetchPost2(page_no);
    }

    checkpin2() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("pin") == null) {
        Navigator.pushNamed(context, PinEnter.sid);
      }
    }

    checkpin2();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkpin();
    });
    //  post = fetchPost();
//    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    try {
      final phone_verification_data args =
          ModalRoute.of(context).settings.arguments;

      if (args.otp != null) {
        addStringToSF(args.otp);
        // Navigator.pushNamed(context,BuyCoinDashboard.sid);
        //  checkpin();
      }
    } catch (e) {}

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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {
      post2 = fetchPost2(1);
    });
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    double height = MediaQuery.of(context).size.height;
    //  print(controller.position.extentAfter);
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      page_no++;
      setState(() {
        post2 = fetchPost2(page_no);
      });
      //  post2=fetchPost2(page_no);
      print(page_no);
    }
    if (controller.position.pixels == controller.position.minScrollExtent) {
      page_no = page_no - 1;
      post3 = post2;

      setState(() {
        post2 = fetchPost2(page_no);
        //post2=[post2,post3];
        //post2={...post2,...post3};
        // post2=post3;
      });
      //  post2=fetchPost2(page_no);
      print(page_no);
    }
  }

  void didChangeDependencies() {
    // super.didChangeDependencies();
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
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }
    //  List<Widget> list2 = new List();
/*for(int j=0; j<10; j++)
  {
    list2.add(GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BuyTradeExplore.sid);
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
                      padding: const EdgeInsets.only(top: 8, bottom: 0),
                      child: Container(
                        width: width - 32,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'ecove007\t',
                                style: text13,
                              ),
                              TextSpan(
                                text: '(500+ ; 99%)',
                                style: text14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        width: width - 32,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'IMPS Bank Transfer India',
                                style: text10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: width - 32,
                        child: Center(
                          child: Container(
                            width: width * 0.8,
                            child: Divider(
                              thickness: 2,
                              color: color2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 0),
                      child: Container(
                        width: width - 32,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Price/BTC\t:\t\t',
                                style: text13,
                              ),
                              TextSpan(
                                text: '555198.37 INR',
                                style: text14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        width: width - 32,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Limit        \t:\t\t',
                                style: text13,
                              ),
                              TextSpan(
                                text: '10000 - 200000 INR',
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
    ),);
  }*/
    return FutureBuilder<TransactionsList>(
      future: post2,
      builder: (context, snapshot) {
        //   */
        if (snapshot.hasData) {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => Pinset()));
          List<Widget> list = new List();

          if (snapshot.data.transactions[0].message == "0") {
            list.add(
              Center(
                child: Text(
                  "Please wait for the new advertisement to be posted",
                  textAlign: TextAlign.center,
                  style: text4,
                ),
              ),
            );
            // _onBasicAlertPressed(context);
          }
          for (int i = 0; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              list.add(
                GestureDetector(
                  onTap: () {
                    if (snapshot.data.transactions[i].email != email) {
                      Navigator.pushNamed(context, BuyTradeExplore.sid,
                          arguments: snapshot.data.transactions[i].id);
                    }
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
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (snapshot.data.transactions[i].email !=
                                          email) {
                                        Navigator.pushNamed(
                                          context,
                                          PersonalProfile.sid,
                                          arguments: CoinDaashboardData(
                                              snapshot.data.transactions[i]
                                                  .username,
                                              snapshot.data.transactions[i]
                                                  .samnevale_ki_id,
                                              snapshot.data.transactions[i].id),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: width - 32,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: snapshot.data
                                                  .transactions[i].username,
                                              style: text13,
                                            ),
                                            TextSpan(
                                              text: '(' +
                                                  snapshot.data.transactions[i]
                                                      .no_of_trades +
                                                  '+ ;' +
                                                  snapshot.data.transactions[i]
                                                      .completed_trade_ratio +
                                                  '%)',
                                              style: text14,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Container(
                                    width: width - 32,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: snapshot.data.transactions[i]
                                                    .pay_method +
                                                ' ' +
                                                snapshot.data.transactions[i]
                                                    .country,
                                            style: text10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, bottom: 0),
                                  child: Container(
                                    width: width - 32,
                                    child: Center(
                                      child: Container(
                                        width: width * 0.8,
                                        child: Divider(
                                          thickness: 2,
                                          color: color2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 0),
                                  child: Container(
                                    width: width - 32,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Price/BTC\t:\t\t',
                                            style: text13,
                                          ),
                                          TextSpan(
                                            text: double.parse(snapshot
                                                        .data
                                                        .transactions[i]
                                                        .price_per_btc)
                                                    .toStringAsFixed(2) +
                                                ' ' +
                                                snapshot.data.transactions[i]
                                                    .currency,
                                            style: text14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Container(
                                    width: width - 32,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Limit        \t:\t\t',
                                            style: text13,
                                          ),
                                          TextSpan(
                                            text: snapshot.data.transactions[i]
                                                    .min_t_limit +
                                                ' - ' +
                                                snapshot.data.transactions[i]
                                                    .max_t_limit,
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
          if (snapshot.data.transactions.length == 0) {
            dispose();
          }
          /*    */

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
                ],
                iconTheme: IconThemeData(
                  color: color4,
                ),
                centerTitle: true,
                elevation: 0.0,
                title: Text(
                  'Buy Bitcoin',
                  style: text4,
                ),
              ),
              body: Container(
                child: SmartRefresher(
                  enablePullDown: true,
                  header: WaterDropHeader(),
                  child: ListView(controller: controller, children: list),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                ),
              ),
//
              bottomNavigationBar: Container(
                color: color1,
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BuyCoinDashboard.sid);
                        },
                        child: Container(
                          color: color2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Buy',
                                style: text5.copyWith(
                                  color: color1,
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
                          Navigator.pushNamed(context, SellCoinDashboard.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sell',
                                style: text4,
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
                          Navigator.pushNamed(context, PostTradeDecide.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Post',
                                style: text4,
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

  _onBasicAlertPressed(context) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Login Again",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.sid);
                  })
            ],
            title: "OTP Verification",
            desc: "OTP Verification Failed")
        .show();
  }
}
