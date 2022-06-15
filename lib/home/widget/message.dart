
import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/screens/detial/detail.dart';

import '../../models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Messages extends StatelessWidget {
  final messagelist =Message.generateHomePageMessages();

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
        topRight: Radius.circular(30))
      ),
      child: _buildMessages(),));
  }

Widget  _buildMessages() {
    return ListView.separated(
      padding: EdgeInsets.zero,
        itemBuilder: (context, index) => _buildMessage(context,index),
        separatorBuilder: (context, index) =>SizedBox(height: 30,),
        itemCount: messagelist.length);
}

  Widget _buildMessage( BuildContext context,int index) {
    return GestureDetector(
        onTap:()
        {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(messagelist[index])));},
      child: Row(children:
      [

        Container(


          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: messagelist[index].user.bgColor,
            shape: BoxShape.circle
          ),
          child: Image.asset(messagelist[index].user.iconUrl,width: 60,),),
        SizedBox(width:10 ,),
        Flexible(child:
        Column(
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('${messagelist[index].user.firstName}  ${messagelist[index].user.lastName}',

                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kPrimaryDark
                  )),

              Text(messagelist[index].lastTime,
                  style:TextStyle(

                      fontSize: 12,
                      color: kGreyLight
                  ))
            ],
          ),
          SizedBox(height: 10,),
          Text(messagelist[index].user.lastName,
            style:TextStyle(

                fontSize: 12,
                color: kPrimaryDark,
            ),
          overflow: TextOverflow.ellipsis,)
          ],
        )
        )]),
    );
  }
}
