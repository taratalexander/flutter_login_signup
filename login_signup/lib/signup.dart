import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:login_signup/validators.dart';

import 'boolean_notifier.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key, required this.onLogInSelected});

  final Function onLogInSelected;
  @override
  ConsumerState<Signup> createState() => _SignupState();
}

final obscurePasswordProvider =
    StateNotifierProvider((_) => BooleanNotifier(false));

final obscurePassword = Provider((ref) => ref.watch(obscurePasswordProvider));

final textFormFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.black, width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.black, width: 1),
  ),
);

class _SignupState extends ConsumerState<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(obscurePasswordProvider.notifier);

    final passwordVisibility = ref.watch(obscurePassword);
    final formKey = GlobalKey<FormState>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: Colors.amber,
      child: Center(
        child: Card(
            elevation: 10,
            child: Container(
              alignment: Alignment.center,
              width: 500,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 340),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sign up to continue",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const Gap(32),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const Gap(10),
                      TextFormField(
                        controller: _emailController,
                        decoration: textFormFieldDecoration,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (value) {
                          var validate = validateEmail(value?.trim());
                          if (validate.error != null) {
                            return validate.error;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                notifier.toggle();
                              },
                              child: passwordVisibility as bool
                                  ? const Text("Show")
                                  : const Text("Hide"),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      TextFormField(
                        controller: _passwordController,
                        key: const Key("Password"),
                        decoration: textFormFieldDecoration,
                        obscureText: passwordVisibility,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (value) {
                          var validate = validatePassword(value?.trim());
                          if (validate.error != null) {
                            return validate.error;
                          }
                          return null;
                        },
                      ),
                      const Gap(25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              return;
                            }
                          },
                          child: const Text("Sign Up"),
                        ),
                      ),
                      const Gap(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Row(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                onPressed: () => {widget.onLogInSelected()},
                                child: const Text(
                                  "Log In",
                                  selectionColor: Colors.transparent,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
