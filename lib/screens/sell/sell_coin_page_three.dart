import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/sell/sell_coin_page_five.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';

class SellCoinPageThree extends StatefulWidget {
  static const sid = 'sell_coin_page_three';

  @override
  _SellCoinPageThreeState createState() => _SellCoinPageThreeState();
}

class _SellCoinPageThreeState extends State<SellCoinPageThree> {
  double value;

  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final buycoin_page_two_data args =
        ModalRoute.of(context).settings.arguments;
    location = args.location;
    paymethod = args.paymethod;
    currency_ex = args.currency_ex;
    bankname = args.bankname;
    margin_ex = args.margin_ex;
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
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
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
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 16),
                              child: Container(
                                width: width - 32,
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Sell Bitcoins ',
                                        style: text2.copyWith(
                                          color: color4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Container(
                                width: width - 32,
                                child: Text(
                                  'Min. transaction limit',
                                  style: text4,
                                ),
                              ),
                            ), //min limit
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 16),
                              child: Container(
                                width: width - 32,
                                child: TextFormField(
                                  onChanged: (text) {},
                                  onSaved: (val) =>
                                      setState(() => min_t_limit_ = val),
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: text8,
                                    helperText:
                                        'Optional. Minimum transaction limit in one trade',
                                    helperStyle: text11,
                                    helperMaxLines: 5,
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color2,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color2,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color2,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  style: text7,
                                  cursorColor: color2,
                                  cursorWidth: 3,
                                ),
                              ),
                            ), //min limit Input

                            Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Container(
                                width: width - 32,
                                child: Text(
                                  'Max. transaction limit',
                                  style: text4,
                                ),
                              ),
                            ), //max limit name
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 16),
                              child: Container(
                                width: width - 32,
                                child: TextFormField(
                                  onChanged: (text) {},
                                  onSaved: (val) =>
                                      setState(() => max_t_limit = val),
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: text8,
                                    helperText:
                                        'Optional. Maximum transaction limit in one trade',
                                    helperStyle: text11,
                                    helperMaxLines: 5,
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color2,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color2,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color2,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  style: text7,
                                  cursorColor: color2,
                                  cursorWidth: 3,
                                ),
                              ),
                            ), //max limit Input

                            Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Container(
                                width: width - 32,
                                child: Text(
                                  'Terms of trade',
                                  style: text4,
                                ),
                              ),
                            ), //max limit name
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: color2, width: 2),
                                ),
                                width: width - 32,
                                child: TextFormField(
                                  textInputAction: TextInputAction.newline,
                                  onChanged: (text) {},
                                  onSaved: (val) =>
                                      setState(() => terms_of_trade = val),
                                  decoration: InputDecoration(
                                    hintText:
                                        'Other information you wish to tell about your trade. Example 1: This advertisement is only for cash trades. If you want to pay online, contact localbitcoins.com/ad/1234. Example 2: Please make request only when you can complete the payment with cash within 12 hours.',
                                    hintStyle: text8.copyWith(
                                      fontSize: 15,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: text7,
                                  cursorColor: color2,
                                  cursorWidth: 3,
                                  maxLines: 5,
                                ),
                              ),
                            ), //max limit Input

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                right: 0,
                                top: 0,
                              ),
                              child: Container(
                                width: width - 32,
                                child: Text(
                                  'Optional',
                                  style: text11,
                                ),
                              ),
                            ),

                            //next previous buttons
                            //buy bitcoins
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
                    Navigator.pushNamed(context, SellCoinPageFive.sid,
                        arguments: buycoin_page_three_data(
                            location,
                            paymethod,
                            currency_ex,
                            margin_ex,
                            bankname,
                            min_t_limit_,
                            max_t_limit,
                            terms_of_trade));
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
}
