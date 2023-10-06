import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.grey.shade300, radius: 40),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Felicia Angelique",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("felicia.angle@gmail.com",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey))
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Text("Personal Information",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey.shade500, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Column(
                children: [
                  Menu(icon: FeatherIcons.user, menu: "Account"),
                  Menu(icon: FeatherIcons.bell, menu: "Notification"),
                  Menu(icon: FeatherIcons.database, menu: "Data and Storage"),
                  Menu(icon: FeatherIcons.settings, menu: "Preferences"),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const Column(
                children: [
                  Menu(icon: FeatherIcons.messageSquare, menu: "Podcast FAQ"),
                  Menu(icon: FeatherIcons.helpCircle, menu: "Help and Support"),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class Menu extends StatelessWidget {
  final IconData icon;
  final String menu;
  const Menu({
    super.key,
    required this.icon,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Icon(icon),
              ),
              Text(
                menu,
                style:
                    Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
          )
        ]),
      ),
    );
  }
}
