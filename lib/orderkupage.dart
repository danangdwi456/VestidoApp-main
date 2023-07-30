import 'package:flutter/material.dart';

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
