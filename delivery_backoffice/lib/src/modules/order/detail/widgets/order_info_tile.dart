import 'package:flutter/material.dart';

import '../../../../core/ui/styles/text_styles.dart';

class OrderInfoTile extends StatelessWidget {
  final String label;
  final String info;

  const OrderInfoTile({Key? key, required this.label, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: context.textStyles.textBold,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            info,
            style: context.textStyles.textMedium,
          ),
        ],
      ),
    );
  }
}
