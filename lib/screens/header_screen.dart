import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple.shade100,
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade200,
                      image: DecorationImage(
                          image: NetworkImage(
                              scale: .50,
                              'https://images.samsung.com/is/image/samsung/p6pim/za/galaxy-s21/gallery/za-clear-cover-galaxy-s21-5g-ef-qg991ttegww-363168624?720_576_PNG'),
                          fit: BoxFit.cover)),
                  accountName: Text('George washington'),
                  accountEmail: Text('Shoeman@Gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic-2.png'),
                  ),
                )),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Colors.deepPurple.shade50,

              leading: Icon(
                Icons.add,
                size: 50,
              ),
              title: Text('add your self'),
              subtitle: Text('something'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_box_rounded),
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Colors.deepPurple.shade50,

              leading: Icon(
                Icons.add,
                size: 50,
              ),
              title: Text('add your self'),
              subtitle: Text('something'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_box_rounded),
              ),
            ),ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Colors.deepPurple.shade50,

              leading: Icon(
                Icons.add,
                size: 50,
              ),
              title: Text('add your self'),
              subtitle: Text('something'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_box_rounded),
              ),
            ),ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Colors.deepPurple.shade50,

              leading: Icon(
                Icons.add,
                size: 50,
              ),
              title: Text('add your self'),
              subtitle: Text('something'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_box_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
