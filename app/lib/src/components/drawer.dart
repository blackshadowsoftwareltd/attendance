import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modules/home/providers/screen.p.dart';
import '../utils/enums.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedScreenProvider);
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ...List.generate(
            Screens.values.length,
            (i) => MaterialButton(
              onPressed: () {
                ref.read(selectedScreenProvider.notifier).set(Screens.values[i]);
                Navigator.pop(context);
              },
              color: selected.screen == Screens.values[i].screen ? Theme.of(context).primaryColor : null,
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Text(Screens.values[i].title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
