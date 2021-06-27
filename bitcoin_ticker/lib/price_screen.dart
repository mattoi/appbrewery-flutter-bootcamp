import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

//TODO fix this whole thing. the app is not showing the values.

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String btcvalue, ethvalue, ltcvalue = '?';
  // https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=CEF1BE79-9DE4-4112-AE4A-D8B2EC3B960F

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownList = [];
    for (String c in currenciesList) {
      dropdownList.add(DropdownMenuItem(
        value: c,
        child: Text(c),
      ));
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownList,
      onChanged: (value) => setState(() {
        selectedCurrency = value;
        getValues();
      }),
    );
  }

  CupertinoPicker cupertinoPicker() {
    List<Text> textList = [];
    for (String c in currenciesList) {
      textList.add(Text(c));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      children: textList,
      onSelectedItemChanged: (int value) {
        selectedCurrency = currenciesList[value];
        getValues();
      },
    );
  }

  void getValues() async {
    try {
      String btc = await CoinData().getCoinData('BTC', selectedCurrency);
      String eth = await CoinData().getCoinData('ETH', selectedCurrency);
      String ltc = await CoinData().getCoinData('LTC', selectedCurrency);
      setState(() {
        btcvalue = btc;
        ethvalue = eth;
        ltcvalue = ltc;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $btcvalue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $ethvalue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $ltcvalue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? cupertinoPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends  StatelessWidget {
  const CryptoCard({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}