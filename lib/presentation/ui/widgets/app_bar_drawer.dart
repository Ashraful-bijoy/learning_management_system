import 'package:flutter/material.dart';

class AppBarDrawer extends StatelessWidget {
  const AppBarDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
              ),
              margin: EdgeInsets.zero,
              child: const Text(
                'Menu',style: TextStyle(
                fontSize: 22,

              ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Cart'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Courses'),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}