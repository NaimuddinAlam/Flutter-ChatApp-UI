import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/detial/widget/contact_info.dart';
import 'package:chat_app/screens/detial/widget/detail_app_bar.dart';
import 'package:chat_app/screens/detial/widget/detail_message.dart';
import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
   final Message message;


   DetailPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Column(

        children: [
          DetialAppBar(),
          ContactInfo(message),
          Expanded(child: DetailMessage())

        ],
      )


    );
  }
}
