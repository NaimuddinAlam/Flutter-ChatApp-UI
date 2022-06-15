import 'package:flutter/material.dart';
class DetialAppBar extends StatelessWidget {
  const DetialAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(onPressed: () =>
              Navigator.of(context).pop(), child: Text("Back",
          style: TextStyle(fontSize: 15,
          color: Colors.white.withOpacity(0.5)),)),
          TextButton(onPressed: () =>{}, child: Text("Search",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.5)
          ),))
        ],
      ),
    );
  }
}
