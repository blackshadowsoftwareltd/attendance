import 'package:app/src/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/screen.p.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedScreenProvider);

    return Scaffold(
      // appBar: AppBar(title: Text('Attendence  ⟿  ${selected.screen}')),
      // drawer: const AppDrawer(),
      body: Row(
        children: [
          const AppDrawer(),
          //     Expanded(flex: 3, child: selected.screen),
        ],
      ),
    );
  }
}
