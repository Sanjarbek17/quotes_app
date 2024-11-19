import 'package:flutter/material.dart';
import 'package:quotes_app/dependency_injection.dart';
import 'package:quotes_app/presentation/bloc/random_qoute_bloc/random_qoute_bloc.dart';
import 'package:quotes_app/presentation/pages/home_screen.dart';
import 'package:quotes_app/presentation/pages/settings_screen.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          SettingsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<RandomQouteBloc>().getQoute();
        },
        child: const Icon(Icons.repeat),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}
