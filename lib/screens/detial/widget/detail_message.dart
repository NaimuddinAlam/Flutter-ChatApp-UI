import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class DetailMessage extends StatelessWidget {
  final myid = 0;
  final list = Message.generateMessagesFromUser();
  final _scrollcontroller=ScrollController();

  @override
  Widget build(BuildContext context) {
    var message=List.from(list.reversed);
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.fromLTRB(25, 50, 25, 80),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ListView.separated(
              reverse: true,
                controller: _scrollcontroller,
                itemBuilder: (context, index) => message[index].user.id == myid
                    ? _buildReceivedText(message[index])
                    : _buildSenderText(message[index]),
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: message.length),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 50,
              width: 300,
              child: Stack(
                children: [

                  TextField(
                    onTap:()
                    {
                    _scrollcontroller.animateTo(
                    0,
                    duration: Duration(microseconds: 300),
                    curve: Curves.ease);
                    },
                    decoration: InputDecoration(
                        fillColor: kGreyLight.withOpacity(0.2),
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        hintText: 'Type your message..',
                        hintStyle: TextStyle(
                          color: kPrimaryDark.withOpacity(0.3),
                          fontSize: 14,
                        )),
                  ),
                  Positioned(
                      right: 8,
                      bottom: 8,
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(right: 20,bottom: 5,top: 10),
                        decoration: BoxDecoration(
                            color: kPrimary, shape: BoxShape.circle),
                        child: Icon(Icons.send, color: Colors.white, size: 20),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReceivedText(Message list) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          list.lastTime,
          style: TextStyle(color: kGreyLight, fontSize: 12),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 180,
            ),
            child: Text(
              list.lastMessage,
              style: TextStyle(height: 1.5, color: kPrimaryDark),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSenderText(Message list) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: list.user.bgColor, shape: BoxShape.circle),
              child: Image.asset(
                list.user.iconUrl,
                width: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kGreyLight.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 180),
                  child: Text(
                    list.lastMessage,
                    style: TextStyle(height: 1.5, color: kPrimaryDark),
                  ),
                ))
          ],
        ),
        Text(
          list.lastTime,
          style: TextStyle(color: kGreyLight, fontSize: 12),
        )
      ],
    );
  }
}
