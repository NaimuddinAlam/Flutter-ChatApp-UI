import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
class ContactInfo extends StatelessWidget {
 final Message message;


 ContactInfo(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 25),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('${message.user.firstName} \n ${message.user.lastName}',
          style: TextStyle(
            height: 1.2,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          Row(
            children: [
              _buildCallButton(Icons.phone),
              SizedBox(width: 10,),
              _buildVideoCallButton(Icons.video_camera_back),
            ],
          )
        ],
      ),
    );
  }

 Widget _buildCallButton(IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.3)
      ),
      padding: EdgeInsets.all(8),

      child: Icon(iconData,color: Colors.white,size: 25,),
    );
  }
 Widget _buildVideoCallButton(IconData iconData) {
   return Container(
     decoration: BoxDecoration(
         shape: BoxShape.circle,
         color: Colors.white.withOpacity(0.3)
     ),
     padding: EdgeInsets.all(8),

     child: Icon(iconData,color: Colors.white,size: 25,),
   );
 }
}
