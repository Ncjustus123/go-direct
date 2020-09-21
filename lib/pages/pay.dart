import 'package:flutter/material.dart';
import 'package:go_direct/pages/existing_cards.dart';
import 'package:go_direct/pages/location.dart';
import 'package:go_direct/service/payment_service.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        var response = await StripeService.payViaNewCard(
          amount: '150',
          currency: 'Naira',
        );
        if (response.success == true) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(response.message),
            duration: new Duration(milliseconds: 1200),
          ));
        }
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExistingCards()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Location ()));
    }
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Payments'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                Icon icon;
                Text text;

                switch (index) {
                  case 0:
                    icon = Icon(Icons.add_circle, color: Colors.green);
                    text = Text(
                      'Pay Via New Card',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    );
                    break;
                  case 1:
                    icon = Icon(Icons.credit_card, color: Colors.green);
                    text = Text('Pay Via Existing Card',
                        style: TextStyle(fontSize: 20, color: Colors.black54));
                    break;
                  case 2:
                    icon = Icon(Icons.location_on, color: Colors.green);
                    text = Text('View rider location',
                        style: TextStyle(fontSize: 20, color: Colors.black54));
                }
                return InkWell(
                  onTap: () {
                    onItemPress(context, index);
                  },
                  child: ListTile(
                    title: text,
                    leading: icon,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Colors.green,
                  ),
              itemCount: 3)),
    );
  }
}
