import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/dependency_injection.dart';
import 'package:quotes_app/gen/assets.gen.dart';
import 'package:quotes_app/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:quotes_app/presentation/widgets/category_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(Assets.images.leftHearhtPicture.path, scale: 0.5),
                Positioned(
                  top: 60,
                  left: 65,
                  child: Text('Favorite', style: context.headlineSmall),
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
            BlocBuilder<FavoriteBloc, FavoriteBlocState>(
              builder: (context, state) {
                if (state.status == FavoriteBlocStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status == FavoriteBlocStatus.error) {
                  return const Center(child: Text('Error'));
                }
                if (state.favorites.isEmpty) {
                  return const Center(child: Text('empty'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.favorites.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        index: index + 1,
                        qoute: state.favorites[index].quote,
                        onTap: () {
                          locator<FavoriteBloc>().add(RemoveFavoriteQuotes(
                            state.favorites[index],
                          ));
                        },
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
