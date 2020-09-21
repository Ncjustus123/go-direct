import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_direct/screen/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GoDirect",
      home: LoginPage(),
      
    )

        //   image: AssetImage('assets/go.png'),
        // ),

        // SvgPicture.asset(
        //   'assets/goDirect.svg',
        //   height: 20.0,
        //   width: 20.0,
        // ),
        // SizedBox(height: 10),
        ;
  }
}
