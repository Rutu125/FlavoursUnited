import 'package:flutter/material.dart';
class NameCard extends StatelessWidget {
  NameCard(this.name, this.img, this.description);

  String name = '';
  String img = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent[100],
      child: Padding(
        padding: EdgeInsets.all(7.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/$img.jpeg'),
              radius: 30.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Lora',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}