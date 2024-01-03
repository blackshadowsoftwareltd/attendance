import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/snack.dart';
import '../../../utils/enums.dart';
import '../../home/providers/screen.p.dart';
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
                onPressed: () async {
                  if (!auth.validateSignin()) {
                    showErrorMessage(context, 'Please fill all the fields');
                    return;
                  }
                  final error = await auth.signin();
                  if (error != null) {
                    if (context.mounted) {
                      showErrorMessage(context, error);
                    }
                    return;
                  }
                  if (context.mounted) {
                    showSuccessMessage(context, 'Signin successful');
                  }
                  ref.read(selectedScreenProvider.notifier).set(Screens.users);
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
