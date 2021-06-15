import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:btc_tracer_app/views/upper_body.dart';
import 'package:btc_tracer_app/model/coin_data.dart';
import 'dart:io' show Platform;
import 'package:btc_tracer_app/controller/request_controller.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({Key? key}) : super(key: key);

  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  String selectedCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    RequestController().getCoinData();
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
          print(value);
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
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItem) {
        print(selectedItem);
      },
      children: currencyPickerList,
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
            UpperBody(),
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
