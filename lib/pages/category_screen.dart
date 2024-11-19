import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/gen/assets.gen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(Assets.images.leftHearhtPicture.path),
                Positioned(
                  top: 60,
                  left: 65,
                  child: Text('Favorites', style: context.headlineSmall),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: context.width - 48,
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: const Text('1'),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Hate is a strong word, but love is stronger.',
                      style: context.titleMedium,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
