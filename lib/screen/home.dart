import 'package:flutter/material.dart';
import 'package:go_direct/screen/cart_display.dart';
import 'package:go_direct/screen/payment.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  String title;
  Home({Key key, this.title}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool expand = false;
  var containerheight = 60.0;

  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue[900],
            child: Column(
              children: <Widget>[
                nameavatar(),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Text(
                      'What would you like to buy today ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 0.5),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              diesel(),
                              lpg(),
                            ],
                          ),
                          SizedBox(height: 0.2),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                orders(),
                                Payments(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          expand == false
              ? Container()
              : SlidingUpPanel(
                  backdropEnabled: true,
                  borderRadius: radius,
                  panel: _body(),
                  collapsed: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: radius,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recent',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: containerheight,
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 200),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      print('clicked');
                      toggle();
                      showsheet();
                    },
                  ),
                ],
              ),
            ),
            CartDisplay(),
            SizedBox(height: 20),
            ButtonTheme(
              height: 60,
              minWidth: 200,
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
                        'Checkout',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Payment()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.only(top: 36.0),
      color: Colors.white,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              'This is meun $index',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }

  void showsheet() {
    setState(() {});
  }

  void toggle() {
    setState(() {
      if (expand) {
        containerheight = 400.0;
        expand = false;
      } else {
        containerheight = 60.0;
        expand = true;
      }
    });
  }
}

class Payments extends StatelessWidget {
  const Payments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            height: 100,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(height: 0.5),
                          Text(
                            'NGN 200,000',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text(
                        'Payments',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      // SizedBox(width: 30),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue[900],
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class orders extends StatelessWidget {
  const orders({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.contact_mail,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 50),
                        Icon(
                          Icons.add_circle,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Text(
                          'Orders',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        // SizedBox(width: 30),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class lpg extends StatelessWidget {
  const lpg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 170,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.contact_mail,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(height: 90),
                Text(
                  'LPG',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class diesel extends StatelessWidget {
  const diesel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            height: 170,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.contact_mail,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 90),
                  Text(
                    'Diesel',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class nameavatar extends StatelessWidget {
  const nameavatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Row(
        children: <Widget>[
          Text(
            'Hi Kelechi,',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(width: 180),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/NEDU.jpeg'),
          ),
        ],
      ),
    );
  }
}
// Padding(
//   padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
//   child: DraggableScrollableSheet(builder: (context, controller) {
//     return Container(

//       child: ListView.builder(
//         itemCount: 10,
//         controller: controller,
//         itemBuilder: (BuildContext context, index) {
//           return ListTile(
//             title: Text('item ${index + 1}'),
//           );
//         },
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20)),
//       ),
//     );
//   }),
// ),
