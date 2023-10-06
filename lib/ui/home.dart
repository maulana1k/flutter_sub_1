import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_submission_1/ui/library.dart';
import 'package:flutter_submission_1/ui/search.dart';
import 'package:flutter_submission_1/ui/profile.dart';

import 'widgets/for_you_carousel.dart';
import 'widgets/last_played.dart';
import 'widgets/main_carousel.dart';
import 'widgets/new_episodes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final _pages = [
    const HomePage(),
    const SearchPage(),
    const SearchPage(),
    const LibraryPage(),
    const ProfilePage(),
  ];

  void _changeIndex(index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FLoatingMusicPlayer(),
      body: _pages[_pageIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300, width: 0.5))),
        child: NavigationBar(
            backgroundColor: Colors.white,
            onDestinationSelected: _changeIndex,
            selectedIndex: _pageIndex,
            indicatorColor: Colors.grey.shade100,
            elevation: 0.0,
            height: 50,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.search_outlined),
                  selectedIcon: Icon(Icons.search),
                  label: "Search"),
              NavigationDestination(
                  icon: Icon(Icons.sensors_outlined),
                  selectedIcon: Icon(Icons.sensors_rounded),
                  label: "Search"),
              NavigationDestination(
                  icon: Icon(Icons.bookmark_outline),
                  selectedIcon: Icon(Icons.bookmark),
                  label: "Library"),
              NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: "Profile"),
            ]),
      ),
    );
  }
}

class FLoatingMusicPlayer extends StatefulWidget {
  const FLoatingMusicPlayer({
    super.key,
  });

  @override
  State<FLoatingMusicPlayer> createState() => _FLoatingMusicPlayerState();
}

class _FLoatingMusicPlayerState extends State<FLoatingMusicPlayer> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: animationController.value * 2.0 * pi,
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.black87, borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(100))),
            child: const Icon(Icons.graphic_eq_rounded, color: Colors.black87, size: 26)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back 👋",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const MainCarousel(),
              const SizedBox(height: 10),
              const ForYouCarousel(),
              const SizedBox(height: 20),
              const LastPlayed(),
              const SizedBox(height: 20),
              const NewEpisodes()
            ],
          ),
        ),
      ),
    );
  }
}
