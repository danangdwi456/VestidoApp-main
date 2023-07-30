import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_index == 0) {
          return true;
        } else {
          setState(() {
            _index = 0;
          });
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: _index == 1
              ? Text('Order Saya')
              : _index == 2
                  ? Text('Bantuan')
                  : _index == 3
                      ? Text('Akun Saya')
                      : Text('Berandaku'),
          leading: _index == 2 || _index == 3
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                )
              : null,
          actions: _index == 1
              ? [
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ]
              : null,
        ),
        extendBody: true,
        body: _index == 1
            ? OrderkuPage()
            : _index == 2
                ? BantuanPage()
                : _index == 3
                    ? Text('Halaman Akun Saya')
                    : BerandakuPage(),
        bottomNavigationBar: FloatingNavbar(
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Berandaku'),
            FloatingNavbarItem(icon: Icons.receipt_outlined, title: 'Orderku'),
            FloatingNavbarItem(icon: Icons.help_rounded, title: 'Bantuan'),
            FloatingNavbarItem(icon: Icons.people, title: 'Akun Saya'),
          ],
        ),
      ),
    );
  }
}

class BerandakuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildBannerCarousel(), // Carousel banner
        _buildCategoryList(), // Daftar kategori produk
        _buildProductHorizontalList(), // Horizontal list produk
        _buildProductVerticalList(), // Vertical list produk
      ],
    );
  }

  Widget _buildBannerCarousel() {
    // Ganti dengan widget carousel yang sesuai
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Selamat Datang Di Vestido',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    // Ganti dengan daftar kategori produk yang sesuai
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.all(8),
            color: Colors.white,
            child: Center(
              child: Text(
                'Kategori $index',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductHorizontalList() {
    // Ganti dengan daftar produk horizontal yang sesuai
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.all(8),
            color: Colors.grey[300],
            child: Center(
              child: Text(
                'Produk $index',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductVerticalList() {
    // Ganti dengan daftar produk vertical yang sesuai
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(
            'https://via.placeholder.com/50', // Ganti dengan URL gambar produk
            height: 50,
            width: 50,
          ),
          title: Text(
            'Produk $index', // Ganti dengan nama produk
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Rp 100.000', // Ganti dengan harga produk
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }
}

class OrderkuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = [
      CartItem(
        image:
            'https://1.bp.blogspot.com/-bAj3aeBpCW4/YRD68jvsO_I/AAAAAAAAC8s/LT7ky4htxJg_KhrPuBrGayMqCcrsc1SPgCLcBGAsYHQ/w0/Cara%2BFoto%2BProduk.png',
        name: 'Kaus ThreeSecond Kuning Uk.31',
        quantity: 1,
        price: 150000.0,
      ),
      CartItem(
        image:
            'https://ae01.alicdn.com/kf/H05e9e58da3d0484d9201b92abd3d22b2R/Zaful-Lebar-Lengan-Leher-Corong-Baju-Wanita-Turtleneck-Solid-Khaki-Pullover-Longgar-Hangat-Musim-Dingin-Di.jpg',
        name: 'Turtleneck Abu-Abu Uk.35',
        quantity: 1,
        price: 200000.0,
      ),
      CartItem(
        image:
            'https://media.karousell.com/media/photos/products/2023/1/28/celana_jeans_pria_oversize_dpu_1674884671_7c0f8639.jpg',
        name: 'Jeans Biru Oversize Uk. 40',
        quantity: 3,
        price: 400000.0,
      ),
    ];

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        CartItem cartItem = cartItems[index];

        return ListTile(
          leading: Image.network(cartItem.image),
          title: Text(cartItem.name),
          subtitle: Text('Jumlah: ${cartItem.quantity}'),
        );
      },
    );
  }
}

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: Icon(Icons.mail),
          title: Text('Email'),
          subtitle: Text('info@vestido.com'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Hubungi Call Center'),
          subtitle: Text('+6283445673933'),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Bantuan Pembayaran'),
          subtitle: Text('Bagaimana melakukan pembayaran'),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Website Call Center'),
          subtitle: Text('www.vestido.com'),
        ),
      ],
    );
  }
}

class CartItem {
  final String image;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
