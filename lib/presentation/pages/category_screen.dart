import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/gen/assets.gen.dart';
import 'package:quotes_app/presentation/bloc/quote_bloc/qoute_bloc.dart';
import 'package:quotes_app/presentation/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  final Color color;
  const CategoryScreen({super.key, required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(Assets.images.leftHearhtPicture.path, scale: 0.5),
                Positioned(
                  top: 60,
                  left: 65,
                  child: Text(category, style: context.headlineSmall),
                ),
                const Positioned(
                  top: 10,
                  right: 40,
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
                Positioned(
                  top: 0,
                  left: 40,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                ),
              ],
            ),
            BlocBuilder<QouteBloc, QouteBlocState>(
              builder: (context, state) {
                if (state.state == QouteBlocStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.state == QouteBlocStatus.error) {
                  return const Center(child: Text('Error'));
                }
                if (state.qoutes.isEmpty) {
                  return const Center(child: Text('empty'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.qoutes.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        index: index + 1,
                        qoute: state.qoutes[index].quote,
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
