import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:go_direct/service/payment_service.dart';

class ExistingCards extends StatefulWidget {
  @override
  _ExistingCardsState createState() => _ExistingCardsState();
}

class _ExistingCardsState extends State<ExistingCards> {
  List cards = [
    {
      'cardNumber': '4444444444444444',
      'expiryDate': '04/24',
      'cardHolderName': 'Chinedu',
      'cvvCode': '244',
      ' showBackView': false,
    },
    {
      'cardNumber': '4444444444444444',
      'expiryDate': '04/24',
      'cardHolderName': 'Ag',
      'cvvCode': '244',
      ' showBackView': false,
    }
  ];

  payViaExisitingCard(BuildContext context, card) {
    var response = StripeService.payViaExisitingCard(
      amount: '150',
      currency: 'Naira',
      card: card,
    );
    if (response.success == true) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(
            content: Text(response.message),
            duration: new Duration(milliseconds: 1200),
          ))
          .closed
          .then((_) {
        Navigator.pop(context);
      });
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Existing Card'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              var card = cards[index];
              return InkWell(
                onTap: () {
                  payViaExisitingCard(context, card);
                },
                child: CreditCardWidget(
                  cardNumber: card['cardNumber'],
                  expiryDate: card['expiryDate'],
                  cardHolderName: card['cardHolderName'],
                  cvvCode: card['cvvCode'],
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
              );
            }),
      ),
    );
  }
}
