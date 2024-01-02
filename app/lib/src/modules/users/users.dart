import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return GridView.builder(
      itemCount: 20,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 7 / 2),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: t.scaffoldBackgroundColor,
          onPressed: () {},
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID : $index'),
                Text('Name : $index'),
                Text('Email : $index'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
