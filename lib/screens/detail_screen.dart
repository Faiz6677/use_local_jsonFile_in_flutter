import 'package:flutter/material.dart';

import '../models/catalog.dart';

class DetailScreen extends StatelessWidget {
  final Item catalog;

  const DetailScreen({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(image: NetworkImage(catalog.image))),
              ),
            ),
            Text(
              catalog.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              catalog.desc,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              buttonPadding: EdgeInsets.all(2.0),
              children: [
                Text('\$${catalog.price}'),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green.shade200),
                    minimumSize: MaterialStateProperty.all(Size(300, 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                    foregroundColor: MaterialStateProperty.all(Colors.black)
                  ),
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('\$${catalog.name} added on car'))),
                    child: Text('Buy'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
