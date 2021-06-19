import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:btc_tracer_app/model/coin_data.dart';
import 'dart:io' show Platform;
import 'package:btc_tracer_app/controller/request_controller.dart';
import 'package:btc_tracer_app/views/reusable_container.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PrintScreen extends StatefulWidget {
  PrintScreen({this.getCurrency});

  final getCurrency;

  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  String selectedCurrency = 'USD';

  String btcRate = '';
  String ethRate = '';
  String ltcRate = '';

  RequestController requestController = RequestController();

  @override
  void initState() {
    super.initState();
    updateUI(widget.getCurrency);
  }

  void updateUI(dynamic currency) async {
   if(currency == null){
     currency = 'USD';
   }
    
    var bitCoinData = await requestController.getCoinData(currency,'BTC');
    var ethCoinData = await requestController.getCoinData(currency,'ETH');
    var ltcCoinData = await requestController.getCoinData(currency,'LTC');


    setState(() {
      if (bitCoinData == null) {
        Alert(
                context: context,
                title: "Error",
                desc: "There is some problem in server")
            .show();
      }

      selectedCurrency = bitCoinData['asset_id_quote'];
      // selectedCurrency = ethCoinData['asset_id_quote'];
      // selectedCurrency = ltcCoinData['asset_id_quote'];
      btcRate = bitCoinData['rate'].toStringAsFixed(0);
      ethRate = ethCoinData['rate'].toStringAsFixed(0);
      ltcRate = ltcCoinData['rate'].toStringAsFixed(0);


    });
  }

  DropdownButton<String> androdDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItems = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItems);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          print(selectedCurrency);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> currencyPickerList = [];
    for (String currency in currenciesList) {
      currencyPickerList.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Color(0xFF15352A),
      itemExtent: 35.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          updateUI(selectedCurrency);
        });
      },
      children: currencyPickerList,
      // r.getCoinData();
    );
  }

  @override
  Widget build(BuildContext context) {
    // getDropDownItems();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 550.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 320,
                    padding: EdgeInsets.only(
                      bottom: 35,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF15352A),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'CRYPTO TRACKER',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 25,
                    right: 25,
                    child: Column(
                      children: [
                        ReusableContainer(
                          currency: '1 BTC = $btcRate $selectedCurrency',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ReusableContainer(
                          currency: '1 ETH = $ethRate $selectedCurrency',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ReusableContainer(
                          currency: '1 LTC = $ltcRate $selectedCurrency',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 175,
            ),
            Container(
              height: 200.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Color(0xFF15352A),
              child: Platform.isIOS ? iOSPicker() : androdDropDown(),
            ),
          ],
        ),
      ),
    );
  }
}
