import 'package:ecommerce_ui/Akun/AkunBottomNavBar.dart';
import 'package:ecommerce_ui/Akun/Akun_body.dart';
import 'package:ecommerce_ui/Akun/Akun_pic.dart';
import 'package:flutter/material.dart';



class AkunScreen extends StatelessWidget {
  static String routeName = "/Akun";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 600,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.purple,

      ),
            child: Column(children: [
              AkunBody(),
            ]
            ),
          ),
        ],
      ),
    );
  }
}

