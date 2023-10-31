import 'package:first_project/models/catalog.dart';
import 'package:first_project/screens/detail_screen.dart';
import 'package:flutter/material.dart';

//Widgets Line number (easy way to find widgets)
// catalogHeader line no 12
// catalogList line no 39
// catalogItem line no 60
// catalogImage line no 132
// reserved for more

class CatalogHeader extends StatelessWidget {
  final String headerText;
  final String subHeaderText;

  const CatalogHeader(
      {super.key, required this.headerText, required this.subHeaderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          headerText,
          style: const TextStyle(
              fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          subHeaderText,
          style: const TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            child: CatalogItem(catalog: catalog),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(catalog: catalog))),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.image,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    catalog.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    catalog.desc,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.only(right: 8.0),
                  children: [
                    Text('\$${catalog.price}'),
                    TextButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(85, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange[300]),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                                content:
                                    Text('${catalog.name} added on cart'))),
                        child: Text('Buy'))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.30,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.black12,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.contain)),
    );
  }
}
