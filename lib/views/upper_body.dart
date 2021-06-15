import 'package:flutter/material.dart';
import 'package:btc_tracer_app/views/reusable_container.dart';

class UpperBody extends StatelessWidget {
  const UpperBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}