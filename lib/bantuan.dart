import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildBody(),
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) => setState(() {
          _index = val;
          _pageController.jumpToPage(val);
        }),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Berandaku'),
          FloatingNavbarItem(icon: Icons.receipt_outlined, title: 'Orderku'),
          FloatingNavbarItem(icon: Icons.help_rounded, title: 'Bantuan'),
          FloatingNavbarItem(icon: Icons.people, title: 'Akun Saya'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_index == 0) {
      // Beranda
      return Center(
        child: Text(
          'Halaman Beranda',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else if (_index == 1) {
      // Order
      return Center(
        child: Text(
          'Halaman Order',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else if (_index == 2) {
      // Bantuan
      return ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('support@example.com'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Hubungi CS'),
            subtitle: Text('1234567890'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Image.asset('assets/call_center_logo.png'),
            title: Text('Call Center'),
            subtitle: Text('1234567890'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Image.asset('assets/whatsapp_logo.png'),
            title: Text('WhatsApp'),
            subtitle: Text('1234567890'),
            onTap: () {
            },
          ),
        ],
      );
    } else {

      return Center(
        child: Text(
          'Halaman Akun Saya',
          style: TextStyle(fontSize: 24),
        ),
      );
    }
  }
}