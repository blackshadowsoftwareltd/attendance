import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modules/home/providers/screen.p.dart';
import '../utils/enums.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedScreenProvider);
    final t = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * .25,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColoredBox(
                  color: t.colorScheme.surfaceTint.withOpacity(.1),
                  child: Center(
                      child: Text(
                    'Attendence  \n⟿\n  ${selected.screen}',
                    style: t.textTheme.bodyLarge?.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColoredBox(
                  color: t.colorScheme.surfaceTint.withOpacity(.1),
                  child: ListView.builder(
                    itemCount: Screens.values.length,
                    itemBuilder: (context, i) => MaterialButton(
                      onPressed: () => ref.read(selectedScreenProvider.notifier).set(Screens.values[i]),
                      color: selected.screen == Screens.values[i].screen ? Theme.of(context).primaryColorDark : null,
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        Screens.values[i].title,
                        style: t.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
