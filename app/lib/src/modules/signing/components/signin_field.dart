import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/signin.p.dart';

class SigninFields extends ConsumerWidget {
  const SigninFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginStateProvider);
    ref.watch(authProvider);
    final auth = ref.read(authProvider.notifier);
    // final n = ref.read(loginStateProvider.notifier);
    return FittedBox(
      child: SizedBox(
        width: 450,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                canRequestFocus: true,
                onChanged: (v) => auth.setEmail(v),
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                canRequestFocus: true,
                onChanged: (v) => auth.setPassword(v),
              ),
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green.withOpacity(.2)),
                onPressed: () {
                  if (!auth.validateSignin()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all the fields', style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                },
                child: Text(login.buttonTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
