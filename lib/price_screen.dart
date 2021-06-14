import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:btc_tracer_app/reusable_container.dart';
import 'package:btc_tracer_app/coin_data.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({Key? key}) : super(key: key);

  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  String selectedCurrency = 'USD';

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItems = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItems);
    }
    return dropDownItems;
  }

  List<Text> pickerItems() {
    List<Text> currencyPickerList = [];
    for (String currency in currenciesList) {
      currencyPickerList.add(Text(currency));
    }
    return currencyPickerList;
  }

  @override
  Widget build(BuildContext context) {
    getDropDownItems();
    return Scaffold(
      body: Column(
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
                        currency: '1 BTC = ? EUR',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ReusableContainer(
                        currency: '1 ETH = ? EUR',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ReusableContainer(
                        currency: '1 LTC = ? EUR',
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
            child: CupertinoPicker(
              backgroundColor: Color(0xFF15352A),
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedItem) {
                print(selectedItem);
              },
              children: pickerItems(),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//               value: selectedCurrency,
//               items: getDropDownItems(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedCurrency = value!;
//                   print(value);
//                 });
//               },
//             ),
