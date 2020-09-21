import 'package:flutter/material.dart';
import 'package:go_direct/models/cart_model.dart';
import 'package:go_direct/models/message_model.dart';

class CartDisplay extends StatefulWidget {
  @override
  _CartDisplayState createState() => _CartDisplayState();
}

class _CartDisplayState extends State<CartDisplay> {
  List<Cart> cartdisplay;
  List<Message> message;
  mycart() {
    Cart diesel = Cart(
      id: 0,
      name: '1x GoDiesel 100',
      imageUrl: 'assets/go.png',
    );
    Cart fuel = Cart(
      id: 1,
      name: '1x GoDiesel 200',
      imageUrl: 'assets/go.png',
    );
    message = [
      Message(
        cartdisplay: diesel,
        description: 'NGN 12000',
      ),
      Message(
        cartdisplay: fuel,
        description: 'NGN 5000',
      )
    ];
    cartdisplay = [diesel, fuel];
  }

  @override
  void initState() {
    mycart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cartdisplay.length,
          itemBuilder: (BuildContext context, int index) {
            return Carts(
              image: cartdisplay[index].imageUrl,
              text: cartdisplay[index].name,
              description: message[index].description,
            );
            // return Container(
            //   padding: const EdgeInsets.all(14.0),
            //   child: Text(
            //     'This is meun $index',
            //     overflow: TextOverflow.ellipsis,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}

class Carts extends StatelessWidget {
  String image;
  String text;
  String description;
  Carts({this.image, this.text, this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 80,
          height: 80,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(text,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(description,
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
