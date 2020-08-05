import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/buy/buy_coin_page_two.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/reading/guide.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyCoinPageOne extends StatefulWidget {
  static const sid = 'buy_coin_page_one';

  @override
  _BuyCoinPageOneState createState() => _BuyCoinPageOneState();
}

class _BuyCoinPageOneState extends State<BuyCoinPageOne> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  double lastcontainerheight;
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
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
                                        text: 'Buy Bitcoins',
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
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 5, top: 32),
                              child: Container(
                                width: width - 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: color2, width: 2),
                                ),
                                child: DropdownButtonFormField<CountryCode>(
                                  icon: Icon(
                                    FontAwesomeIcons.angleDown,
                                    color: color2,
                                  ),
                                  style: text7,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  hint: Text(
                                    "Location",
                                    style: text8,
                                  ),
                                  value: selectedCountry,
                                  onChanged: (CountryCode Value) {
                                    setState(() {
                                      selectedCountry = Value;
                                    });
                                  },
                                  onSaved: (val) => setState(
                                      () => location = selectedCountry),
                                  items: country.map(
                                    (CountryCode country) {
                                      return DropdownMenuItem<CountryCode>(
                                        value: country,
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  country.name,
                                                  style: text7.copyWith(
                                                      fontSize: 15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ), //location Buy Bitcoins
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                right: 0,
                                top: 0,
                              ),
                              child: Container(
                                width: width - 32,
                                child: Text(
                                  'You need to specify the country from where you want to buy bitcoins',
                                  style: text11,
                                ),
                              ),
                            ),

                            //location help text

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 5, top: 32),
                              child: Container(
                                width: width - 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: color2, width: 2),
                                ),
                                child: DropdownButtonFormField<PaymentMethod>(
                                  icon: Icon(
                                    FontAwesomeIcons.angleDown,
                                    color: color2,
                                  ),
                                  style: text7,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  hint: Text(
                                    "Payment Method",
                                    style: text8,
                                  ),
                                  value: selectedpayname,
                                  onChanged: (PaymentMethod Value) {
                                    setState(() {
                                      selectedpayname = Value;
                                    });
                                  },
                                  onSaved: (val) => setState(
                                      () => paymethod = selectedpayname),
                                  items: paymentmethod.map(
                                    (PaymentMethod paymentmethod) {
                                      return DropdownMenuItem<PaymentMethod>(
                                        value: paymentmethod,
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  paymentmethod.payname,
                                                  style: text7.copyWith(
                                                      fontSize: 15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ), //payment method bitcoins
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                right: 0,
                                top: 0,
                              ),
                              child: Container(
                                width: width - 32,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, Guide.sid);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'See the payment method risk assesment in ',
                                          style: text11,
                                        ),
                                        TextSpan(
                                          text: 'guide.',
                                          style: text11.copyWith(
                                            color: color6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 5, top: 32),
                              child: Container(
                                width: width - 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: color2, width: 2),
                                ),
                                child: DropdownButtonFormField<Currency>(
                                  icon: Icon(
                                    FontAwesomeIcons.angleDown,
                                    color: color2,
                                  ),
                                  style: text7,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  hint: Text(
                                    "Currency",
                                    style: text8,
                                  ),
                                  value: selectedcurrecny,
                                  onChanged: (Currency Value) {
                                    setState(() {
                                      selectedcurrecny = Value;
                                    });
                                  },
                                  onSaved: (val) => setState(
                                      () => currency_ex = selectedcurrecny),
                                  items: currency.map(
                                    (Currency currency) {
                                      return DropdownMenuItem<Currency>(
                                        value: currency,
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  currency.currency,
                                                  style: text7.copyWith(
                                                      fontSize: 15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ), //payment method bitcoins
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                right: 0,
                                top: 0,
                              ),
                              child: Container(
                                width: width - 32,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'Your advertisement will be shown to the dashboard of only those who want to sell bitcoins in this currency.',
                                        style: text11,
                                      ),
                                    ],
                                  ),
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
                    Navigator.pushNamed(context, BuyCoinPageTwo.sid,
                        arguments: buycoin_page_one_data(
                            location, paymethod, currency_ex));
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
