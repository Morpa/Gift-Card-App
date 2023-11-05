import 'package:flutter/material.dart';

import '../models/card_model.dart';
import 'app_text.dart';

class CustomGiftCard extends StatelessWidget {
  final CardModel card;
  final double width;
  final int? value;
  final bool showLabel;
  final bool showValue;

  const CustomGiftCard({
    super.key,
    required this.card,
    required this.width,
    this.showLabel = true,
    this.showValue = false,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                card.thumbnailPath,
                fit: BoxFit.cover,
              ),
            ),
            if (showLabel) ...[
              const SizedBox(height: 10),
              AppText.medium(card.name),
            ],
            if (showValue)
              Positioned(
                bottom: 10,
                right: 10,
                child: AppText.medium('\${$value}'),
              ),
          ],
        ),
      ],
    );
  }
}
