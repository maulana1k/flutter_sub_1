import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: const Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Categories("Saved"),
                      Categories("Downloads"),
                      Categories("Last PLayed"),
                      Categories("Subscription"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    SavedItem("UX Talks"),
                    SavedItem("Study With Me"),
                    SavedItem("Easy English"),
                    SavedItem("Workout"),
                    SavedItem("Mental Health"),
                    SavedItem("Society"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SavedItem extends StatelessWidget {
  final String name;
  const SavedItem(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                ),
                Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  final String name;
  const Categories(
    this.name, {
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _isChecked = false;

  void check() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: check,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: _isChecked ? Colors.blue : Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Text(
          widget.name,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: _isChecked ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}
