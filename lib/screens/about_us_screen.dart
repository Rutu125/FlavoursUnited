import 'package:flavours_united/constants.dart';
import 'package:flutter/material.dart';
import 'package:flavours_united/components/name_card_about_us.dart';

class AboutUsScreen extends StatelessWidget {
  static String id = 'about_us_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    fontFamily: 'Lobster',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                NameCard('Ruturaj Ghatage', 'ruturaj', 'Developer'),
                NameCard('Vineet Deshpande', 'bund', 'Cute Boy'),
                NameCard('Maitreya Dalvi', 'maitreya', 'Bhaga che Ambani'),
                NameCard('Ayush Pandit', 'ayush', 'Jon Snow'),
                NameCard('Samihan Gadre', 'samihan', 'Bhaga che Adani'),
                NameCard('Anurag Patil', 'anurag', 'Head boy'),
                NameCard('Shreetej Hirugade', 'shree', 'Iphone 13 pro max'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
