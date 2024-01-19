import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/core/dialog/retry_dialog.dart';
import 'package:acl_flutter/core/router/routes.dart';
import 'package:acl_flutter/core/widget/text_input.dart';
import 'package:acl_flutter/screens/login_page/bloc/login_page_bloc.dart';
import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/widget/spinkit_indicator.dart';
import '../../../di.dart';

enum PostMode { create, update }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPage> {
  String postTitle = "";
  String postBody = "";
  int postId = 0;
  final formKey = GlobalKey<FormState>();
  var username = TextEditingController(text: "");
  var password = TextEditingController(text: "");

  @override
  void initState() {
    // initializeValues();
    super.initState();
  }

  @override
  void dispose() {
    initializeValues();
    super.dispose();
  }

  initializeValues() {
    getIt<LoginPageBloc>().add(LoginPageInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<LoginPageBloc>();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocListener<LoginPageBloc, LoginPageState>(
        listener: (context, state) {
          if (state.submitStatus.isSuccess && state.moveTo == Routes.userList) {
            username.clear();
            password.clear();
            getIt<LoginPageBloc>().add(LoginPageInitialEvent());
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.sidebarPage,
              (Route<dynamic> route) => false,
            );
          } else if (state.submitStatus.isInProgress) {
            const SpinKitIndicator(type: SpinKitType.circle);
          } else if (state.submitStatus.isFailure) {
            showDialog(
                context: context,
                builder: (BuildContext context) => RetryDialog(
                    title: 'username dan password salah',
                    onCancelPressed: () => [
                          Navigator.pop(context),
                        ]));
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BlocBuilder<LoginPageBloc, LoginPageState>(
                  builder: (context, state) {
                // if(state.status.isLoading){
                //   return const SpinKitIndicator(type: SpinKitType.circle);
                // } else if(state.status.isError){
                //   return RetryDialog(
                //       title: 'username dan password salah',
                //       onCancelPressed: () => viewModel.add(LoginPageInitialEvent()) ,
                //       onRetryPressed: () =>
                //           viewModel.add(LoginSubmittedEvent()));
                // }
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: Image.asset("assets/images/allianz_logo.png"),
                        ),
                        Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextInput(
                                              controller: username,
                                              keyboardType: TextInputType.phone,
                                              maxLength: 8,
                                              icon: const Icon(Icons.person),
                                              label: const Text("Username"),
                                              validator: (String? value) {
                                                if (state.userName.isNotValid) {
                                                  return state
                                                      .userName.invalidUserName;
                                                }
                                                return null;
                                              },
                                              onChanged: (String input) {
                                                viewModel.add(
                                                    UserNameInputEvent(input));
                                              },
                                            ),
                                            const SizedBox(height: 15),
                                            TextInput(
                                              controller: password,
                                              // initialValue: postBody,
                                              icon: const Icon(Icons.password),
                                              label: const Text("Password"),
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: true,
                                              validator: (String? value) {
                                                if (state.password.isValid)
                                                  return null;
                                                return "Password tidak boleh kosong";
                                              },
                                              onChanged: (String input) {
                                                viewModel.add(
                                                    PasswordInputEvent(input));
                                              },
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    viewModel.add(
                                                        LoginSubmittedEvent());
                                                  }
                                                },
                                                child: Text("Login".toCapital),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: const Text(
                                            'Lupa Password?',
                                            style: TextStyle(
                                                color: AclColors.primaryBlue),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        BlocBuilder<LoginPageBloc, LoginPageState>(
                          builder: (context, state) {
                            return state.submitStatus.isInProgress
                                ? const SpinKitIndicator(
                                    type: SpinKitType.circle)
                                : Container();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
