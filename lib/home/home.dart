import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/home/widget/message.dart';
import 'package:chat_app/home/widget/recent_contacts.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        margin: EdgeInsets.only(top: 30),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text('Chat with\nyour friends',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
           ),
            ),
            RecentContacts(),
            Messages()
          ],
        ),
      )

    );
  }
}
