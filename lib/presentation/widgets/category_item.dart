import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String qoute;
  final VoidCallback onTap;
  const CategoryItem({
    super.key,
    required this.index,
    required this.qoute, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SizedBox(
        width: context.width - 48,
        child: Row(
          children: [
            Container(
              width: 44,
              height: 42,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 4, spreadRadius: -1, offset: const Offset(0, 5))]),
              alignment: Alignment.center,
              child: Text(index.toString(), style: context.titleMedium),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: context.width * 0.65,
              child: Text(
                qoute,
                style: context.titleMedium,
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
