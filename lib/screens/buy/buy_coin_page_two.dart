import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_three.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost(String curr) async {
  // BuildContext context;
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString('email', email);
  // prefs.setString('t_status','1');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/get_current_price_for_post.php?key=anu5781&email=' +
          email +
          '&curr=' +
          curr);
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
  double btc_to_usd;
  // String id;
//  final String title;
//  final String body;

  Post({this.message, this.btc_to_usd});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(message: json["message"], btc_to_usd: json["btc_to_usd"]
        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class BuyCoinPageTwo extends StatefulWidget {
  static const sid = 'buy_coin_page_two';

  @override
  _BuyCoinPageTwoState createState() => _BuyCoinPageTwoState();
}

class _BuyCoinPageTwoState extends State<BuyCoinPageTwo> {
  double value;
  double margin = 1;
  double btcvalue = 1000;
  double btctradevalue;
  bool margin_or_price = true;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  Future<Post> post;
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;

  void initState() {
    super.initState();
    final buycoin_page_one_data args =
        ModalRoute.of(context).settings.arguments;
    location = args.location;
    paymethod = args.paymethod;
    currency_ex = args.currency_ex;
    post = fetchPost(currency_ex.currency);
  }

  void didChangeDependencies() {
    super.didChangeDependencies();

    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    //  post = fetchPost(firstname,email,lastname);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    lastcontainerheight = height - 510 - 70 - 85;

    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
    }

    setState(() {
      btctradevalue = btcvalue * margin;
    });
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
            btcvalue = snapshot.data.btc_to_usd;
            return Container(
                child: Scaffold(
              drawer: SideBar(),

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
                  'Post Advertisement',
                  style: text4,
                ),
              ),
              body: Form(
                key: _formKey2,
                autovalidate: _autoValidate,
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
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
                                          top: 0, bottom: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: Center(
                                          child: Container(
                                            height: height * 0.05,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 16),
                                      child: Container(
                                        width: width - 32,
                                        child: RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Buy Bitcions ',
                                                style: text2.copyWith(
                                                  color: color4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          left: 0, right: 0),
//                                      child: Container(
//                                        width: width - 32,
//                                        child: Text(
//                                          'Bank name',
//                                          style: text4,
//                                        ),
//                                      ),
//                                    ), //bank name
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          left: 0,
//                                          right: 0,
//                                          top: 0,
//                                          bottom: 16),
//                                      child: Container(
//                                        width: width - 32,
//                                        child: TextFormField(
//                                          textInputAction:
//                                              TextInputAction.newline,
//                                          onChanged: (text) {},
//                                          onSaved: (val) =>
//                                              setState(() => bankname = val),
//                                          decoration: InputDecoration(
//                                            hintText: 'ABC Bank',
//                                            hintStyle: text8,
//                                            helperText:
//                                                'Required. The name or identity code of the bank you are using.',
//                                            helperStyle: text11,
//                                            helperMaxLines: 5,
//                                            border: UnderlineInputBorder(
//                                              borderSide: BorderSide(
//                                                color: color2,
//                                                width: 2,
//                                              ),
//                                            ),
//                                            enabledBorder: UnderlineInputBorder(
//                                              borderSide: BorderSide(
//                                                color: color2,
//                                                width: 2,
//                                              ),
//                                            ),
//                                            focusedBorder: UnderlineInputBorder(
//                                              borderSide: BorderSide(
//                                                color: color2,
//                                                width: 3,
//                                              ),
//                                            ),
//                                          ),
//                                          autofocus: true,
//                                          keyboardType: TextInputType.text,
//                                          style: text7,
//                                          cursorColor: color2,
//                                          cursorWidth: 3,
//                                        ),
//                                      ),
//                                    ), //bank name Input

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0),
                                      child: Container(
                                        width: width - 32,
                                        child: Text(
                                          'Price equation',
                                          style: text4,
                                        ),
                                      ),
                                    ), //margin
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 8),
                                      child: Container(
                                        width: width - 32,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                          ),
                                          child: Text(
                                            'btc_in_' +
                                                currency_ex.currency +
                                                ' * $margin',
                                            style: text8,
                                          ),
                                        ),
                                      ),
                                    ), //price equation
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 8),
                                      child: Container(
                                        width: width - 32,
                                        child: Divider(
                                          thickness: 2,
                                          color: color2,
                                        ),
                                      ),
                                    ), //price equation

                                    Container(
                                      width: width - 32,
                                      child: Row(
                                        children: <Widget>[
                                          Visibility(
                                            visible: margin_or_price,
                                            child: Expanded(
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 0),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: Text(
                                                        'Margin',
                                                        style: text4,
                                                      ),
                                                    ),
                                                  ), //margin
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            top: 0,
                                                            bottom: 16),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: TextField(
                                                        onChanged: (text) {
                                                          setState(
                                                            () {
                                                              margin = double.parse(
                                                                          text) /
                                                                      100 +
                                                                  1;
                                                              print(margin);
                                                              margin_ex = margin
                                                                  .toString();
                                                              btctradevalue =
                                                                  btcvalue *
                                                                      margin;
                                                            },
                                                          );
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Icon(
                                                            FontAwesomeIcons
                                                                .percent,
                                                            color: color2,
                                                          ),
                                                          hintText: '4',
                                                          hintStyle: text8,
                                                          helperText:
                                                              'Margin you want over the bitcoin market price. For more info visit guide.',
                                                          helperStyle: text11,
                                                          helperMaxLines: 5,
                                                          border:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: color2,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: color2,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: color2,
                                                              width: 3,
                                                            ),
                                                          ),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: text7,
                                                        cursorColor: color2,
                                                        cursorWidth: 3,
                                                      ),
                                                    ),
                                                  ), //margin Input
                                                ],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: !margin_or_price,
                                            child: Expanded(
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 0),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: Text(
                                                        'Price',
                                                        style: text4,
                                                      ),
                                                    ),
                                                  ), //margin
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            top: 0,
                                                            bottom: 16),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: TextField(
                                                        onChanged: (text) {
                                                          setState(
                                                            () {
                                                              btctradevalue =
                                                                  double.parse(
                                                                      text);

                                                              margin =
                                                                  ((btctradevalue /
                                                                              btcvalue) -
                                                                          1) *
                                                                      100;
                                                              margin_ex = margin
                                                                  .toString();
                                                            },
                                                          );
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: '1000',
                                                          hintStyle: text8,
                                                          helperText: '',
                                                          helperStyle: text11,
                                                          helperMaxLines: 5,
                                                          border:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: color2,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: color2,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: color2,
                                                              width: 3,
                                                            ),
                                                          ),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: text7,
                                                        cursorColor: color2,
                                                        cursorWidth: 3,
                                                      ),
                                                    ),
                                                  ), //margin Input
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), //margin to btc

                                    Container(
                                      width: width - 32,
                                      child: Row(
                                        children: <Widget>[
                                          Visibility(
                                            visible: margin_or_price,
                                            child: Expanded(
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            top: 16,
                                                            bottom: 8),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: Text(
                                                        'Current market value',
                                                        style: text13.copyWith(
                                                            fontSize: 15),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ), //total price
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            top: 0,
                                                            bottom: 8),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: Text(
                                                        btctradevalue
                                                                .toStringAsFixed(
                                                                    2) +
                                                            currency_ex
                                                                .currency +
                                                            '/BTC',
                                                        style: text2,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ), //total price
                                                ],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: !margin_or_price,
                                            child: Expanded(
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            top: 16,
                                                            bottom: 8),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: Text(
                                                        'Your margin',
                                                        style: text13.copyWith(
                                                            fontSize: 15),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ), //total price
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            top: 0,
                                                            bottom: 8),
                                                    child: Container(
                                                      width: width - 32,
                                                      child: Text(
                                                        '$margin %',
                                                        style: text2,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ), //total price
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  FloatingActionButton(
                                                    backgroundColor: color2,
                                                    child:
                                                        Icon(Icons.swap_vert),
                                                    onPressed: () {
                                                      setState(() {
                                                        margin_or_price =
                                                            !margin_or_price;
                                                        btcvalue = snapshot
                                                            .data.btc_to_usd;
                                                        margin = 1;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), //btc value to margin
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //whitecard
                    ],
                  ),
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
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Previous',
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
                          if (_formKey2.currentState.validate()) {
                            final FormState form = _formKey2.currentState;
                            form.save();
                            Navigator.pushNamed(context, BuyCoinPageThree.sid,
                                arguments: buycoin_page_two_data(
                                    location,
                                    paymethod,
                                    currency_ex,
                                    margin_ex,
                                    bankname));
                          } else {
                            _autoValidate = true;
                          }
                        },
                        child: Container(
                          color: color2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Next',
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
                  ],
                ),
              ),
            ));
          }

          // return Text(snapshot.data.id);
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

        // By default, show a loading spinner.
        //     return CircularProgressIndicator();
      },
    );
  }
}
