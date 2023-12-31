import 'package:app/src/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/signin.p.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context);
    final login = ref.watch(loginStateProvider);
    final n = ref.read(loginStateProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: login == LoginType.signin ? null : () => n.toggle(),
            child: AnimatedContainer(
              height: login == LoginType.signin ? 400 : 70,
              width: login == LoginType.signin ? 500 : 300,
              duration: const Duration(milliseconds: 500),
              decoration: _decoration(login == LoginType.signin, t),
              alignment: login == LoginType.signin ? null : Alignment.center,
              child: login == LoginType.signin
                  ? null
                  : Text(
                      login.title,
                      style: t.textTheme.labelLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
          GestureDetector(
            onTap: login == LoginType.signup ? null : () => n.toggle(),
            child: AnimatedContainer(
              height: login == LoginType.signup ? 400 : 70,
              width: login == LoginType.signup ? 500 : 300,
              duration: const Duration(milliseconds: 500),
              decoration: _decoration(login == LoginType.signup, t),
              alignment: login == LoginType.signup ? null : Alignment.center,
              child: login == LoginType.signup
                  ? null
                  : Text(
                      login.title,
                      style: t.textTheme.labelLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration(bool selected, ThemeData t) => BoxDecoration(
        borderRadius: BorderRadius.circular(selected ? 20 : 100),
        boxShadow: [
          BoxShadow(
            color: selected ? Colors.black.withOpacity(0.2) : t.colorScheme.secondary,
          ),
        ],
      );
}
