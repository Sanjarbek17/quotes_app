import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/core/category_list.dart';
import 'package:quotes_app/presentation/bloc/random_qoute_bloc/random_qoute_bloc.dart';
import 'package:quotes_app/presentation/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                width: context.width,
                padding: const EdgeInsets.only(right: 22, left: 22, top: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: categoryColors
                        .map(
                          (e) => CategoryCard(
                            title: e['category'],
                            color: e['color'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
