import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

const loginGitHub = "loginGitHub";
const loginGoogle = "loginGoogle";
const loginSSO = "loginSSO";
const loginEmail = "loginEmail";
const loginAnonymous = "loginAnonymous";
const signupOption = "signupOption";

bool showGoogleAuth = true;
bool showGitHubAuth = true;
bool showSsoAuth = true;
bool showEmailAuth = true;
bool showAnonymousAuth = true;
bool showSignupOption = true;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onSignUpSelected});

  final Function onSignUpSelected;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 340,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "screenTitle",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Visibility(
                  visible: showGoogleAuth,
                  child: Column(
                    children: [
                      const Gap(25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(),
                                margin: const EdgeInsets.only(right: 70),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  // child: Image.asset('/assets/search.png',
                                  //     package: 'login',
                                  //     width: 30,
                                  //     height: 30),
                                ),
                              ),
                              const SizedBox(
                                  width: 180,
                                  child: Text(
                                    "Log in with Google",
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: showGitHubAuth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Gap(50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(),
                                margin: const EdgeInsets.only(right: 75),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: const Icon(Icons.login_rounded),
                                ),
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Log in with Github',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: showSsoAuth,
                    child: Column(
                      children: [
                        const Gap(50),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(),
                                  margin: const EdgeInsets.only(right: 70),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: const Icon(
                                        Icons.key,
                                        size: 30,
                                        color: Colors.black,
                                      ))),
                              const SizedBox(
                                  width: 180,
                                  child: Text(
                                    'Log in with SSO',
                                  ))
                            ]),
                          ),
                        ),
                      ],
                    )),
                Visibility(
                  visible: showEmailAuth,
                  child: Column(
                    children: [
                      const Gap(50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(),
                                margin: const EdgeInsets.only(right: 70),
                                child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: const Icon(
                                      Icons.mail,
                                      size: 30,
                                      color: Colors.black,
                                    ))),
                            const SizedBox(
                              width: 180,
                              child: Text(
                                'Log in with Email',
                              ),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: showAnonymousAuth,
                  child: Column(
                    children: [
                      const Gap(50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(),
                                margin: const EdgeInsets.only(right: 70),
                                child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: const Icon(
                                      Icons.account_circle,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Log in Anonymous',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: showSignupOption,
                  child: Column(
                    children: [
                      const Gap(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () => {widget.onSignUpSelected()},
                            child: const Text(
                              "Sign up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "By creating an account, you agree to the ",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextSpan(
                            text: "Terms of Service.",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    "https://docs.github.com/en/site-policy/github-terms/github-terms-of-service";
                                if (!await launchUrl(Uri.parse(url))) {
                                  throw 'Could not launch $url';
                                }
                              },
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blueGrey)),
                        const TextSpan(
                          text:
                              "For more information about our privacy practices, see the ",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextSpan(
                          //onTap: () => {print("Clicked")},
                          text: "Privacy Statement.",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              var url =
                                  "https://docs.github.com/en/site-policy/github-terms/github-terms-of-service";
                              if (!await launchUrl(Uri.parse(url))) {
                                throw 'Could not launch $url';
                              }
                            },
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setAuthOptions(List config) {
    showGitHubAuth = config.contains(loginGitHub);
    showGoogleAuth = config.contains(loginGoogle);
    showEmailAuth = config.contains(loginEmail);
    showSsoAuth = config.contains(loginSSO);
    showAnonymousAuth = config.contains(loginAnonymous);
    showSignupOption = config.contains(signupOption);
  }
}
