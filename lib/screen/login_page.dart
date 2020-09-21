import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_direct/screen/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Center(
              child: SvgPicture.asset(
                'assets/goDirect.svg',
                height: 100.0,
                width: 50.0,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            _bulldEmail(),
            SizedBox(height: 40),
            _buildPassword(),
            SizedBox(height: 40),
            Donthaveacc(),
            SizedBox(height: 40),
            ButtonTheme(
              height: 60,
              minWidth: 300,
              child: RaisedButton(
                elevation: 5.0,
                disabledColor: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home(title: "ftftyf")));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Donthaveacc extends StatelessWidget {
  const Donthaveacc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            'Dont have an account?',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          Text(
            'Register Here',
            style: TextStyle(
                color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _buildPassword extends StatelessWidget {
  const _buildPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Text(
            'Password',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: TextField(),
        ),
      ],
    );
  }
}

class _bulldEmail extends StatelessWidget {
  const _bulldEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Text(
            'Email',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: TextField(),
        ),
      ],
    );
  }
}
