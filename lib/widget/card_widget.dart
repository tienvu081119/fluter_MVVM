
import 'package:app_ui_03/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CardWidget {
  Widget headerHome() {
    return Container();
  }

  Widget buildCartItem() {
    return ListTile(
      leading: Image(
        image: AssetImage('assets/images/apple.png'),
        fit: BoxFit.contain,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Apple',
              ),
              Row(children: [
                Text('1x'),
                Text('U\$  18.0'),
              ])
            ],
          ),
          Row(
            children: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
          )
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, Products product) {
    return InkWell(
            onTap: () async {
        Navigator.of(context).pushNamed('/Detail',
              arguments: {'product': product, 'someString': 'haha'});        
      },

    child: Card(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset('assets/images/apple.png',
                        fit: BoxFit.contain),
                  ),
                ],
              ),
              Text(
                'Apple',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'US \$ 200.0',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10))),
                        child: Icon(Feather.shopping_bag, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            child: Icon(AntDesign.hearto, size: 16, color: Colors.red),
            right: 3,
          )
        ],
      ),
    ),
    );
  }
}
