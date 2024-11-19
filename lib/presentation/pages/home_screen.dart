import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/presentation/bloc/random_qoute_bloc/random_qoute_bloc.dart';
import 'package:quotes_app/presentation/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purple.shade100,
          body: SafeArea(
            child: Column(
              children: [
                BlocBuilder<RandomQouteBloc, RandomQouteBlocState>(
                  builder: (context, state) {
                    if (state.state == RandomQouteBlocStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.state == RandomQouteBlocStatus.error) {
                      return const Center(child: Text('Error'));
                    }
                    return Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Text(
                        state.quotesModel?.quote ?? '',
                        style: context.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CategoryCard(title: 'INSPIRATION', color: Colors.yellow.shade100),
                            CategoryCard(title: 'LIFE', color: Colors.purple.shade100),
                            CategoryCard(title: 'LOVE', color: Colors.red.shade100),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
