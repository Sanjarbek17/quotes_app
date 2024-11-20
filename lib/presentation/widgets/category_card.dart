import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/custom_router.dart';
import 'package:quotes_app/dependency_injection.dart';
import 'package:quotes_app/presentation/bloc/quote_bloc/qoute_bloc.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryCard({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: context.width * 0.85,
        height: 115,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.black.withOpacity(0.3),
            onTap: () {
              locator<QouteBloc>().add(FetchQouteEvent(title.toLowerCase()));
              Navigator.pushNamed(
                context,
                CustomRouter.categoryScreen,
                arguments: {
                  'color': color,
                  'category': title,
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: context.headlineSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
