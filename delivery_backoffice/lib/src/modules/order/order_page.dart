import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Container(
          color: Colors.grey[50],
          padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
          child: const Column(
            children: [
              
            ],
          ),
        );
      },
    );
  }
}
