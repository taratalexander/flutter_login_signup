import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'boolean_notifier.dart';
import 'constants.dart';
import 'login_page.dart';
import 'signup.dart';
import 'theme/palette.dart';

void main() {
  runApp(const ProviderScope(child: Calculator()));
}

final isLoginProvider = StateNotifierProvider((_) => BooleanNotifier(false));

final loginState = Provider((ref) => ref.watch(isLoginProvider));

class Calculator extends StatelessWidget {
  const Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: const MyHomePage(title: 'Login Animation'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  final Option selectedOption = Option.LogIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: AnimatedHomeScreen(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: const Text(
                "AML",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedHomeScreen extends ConsumerWidget {
  const AnimatedHomeScreen({super.key});

  final Duration duration = const Duration(seconds: 1);

  Option getUserSelection(bool isLogin) {
    if (isLogin) {
      return Option.LogIn;
    } else {
      return Option.SignUp;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(isLoginProvider.notifier);

    var isLogin = ref.watch(loginState);

    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Container(
          child: getUserSelection(isLogin as bool) == Option.LogIn
              ? LoginPage(
                  onSignUpSelected: () {
                    notifier.toggle();
                  },
                )
              : Signup(
                  onLogInSelected: () {
                    notifier.toggle();
                  },
                ),
        )
        //}
        );
  }
}
