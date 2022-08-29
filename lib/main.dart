import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'favourites_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0; // ตำแหน่งเริ่ม ปุ่ม Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue.shade700,
      ),
      backgroundColor: Colors.greenAccent,
      drawer: const NavigationDrawer(),
      body: Center(
        child: Text('$index',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 120,
                fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.orange),
        ),
        child: CurvedNavigationBar(
          index: index, // ตำแหน่งเริ่ม
          height: 60.0, // ส่วนสูง
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.settings, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.white, // สีพื้น
          buttonBackgroundColor: Colors.blue.shade200, // สีปุ่มที่เลือก
          backgroundColor: Colors.transparent, // สีพื้นหลัง
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600), // ความเร็ว
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.blue.shade700,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(
                  'https://st3.depositphotos.com/8950810/17657/v/450/depositphotos_176577870-stock-illustration-cute-smiling-funny-robot-chat.jpg'),
            ),
            SizedBox(height: 12),
            Text('Flutter Dev',
                style: TextStyle(fontSize: 28, color: Colors.white)),
            Text('Flutter@Dev.com',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16, // vertical spacing
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Home Page')));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Favourites'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavouritesPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text('Workflow'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () {},
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text('Plugins'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              onTap: () {},
            )
          ],
        ),
      );
}
