import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/gen/assets.gen.dart';
import 'package:quotes_app/presentation/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: const SafeArea(
        child: CategoryList(),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(Assets.images.leftHearhtPicture.path, scale: 0.5),
            Positioned(
              top: 60,
              left: 65,
              child: Text('Favorites', style: context.headlineSmall),
            ),
            const Positioned(
              top: 10,
              right: 40,
              child: Icon(Icons.favorite, color: Colors.red),
            ),
          ],
        ),
        const Column(
          children: [
            CategoryItem(),
            CategoryItem(),
            CategoryItem(),
          ],
        )
      ],
    );
  }
}
