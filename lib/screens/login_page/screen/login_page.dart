import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/core/dialog/retry_dialog.dart';
import 'package:acl_flutter/core/router/routes.dart';
import 'package:acl_flutter/core/widget/text_input.dart';
import 'package:acl_flutter/main.dart';
import 'package:acl_flutter/screens/login_page/bloc/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/widget/drop_down.dart';
import '../../../core/widget/empty_widget.dart';
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
      appBar: AppBar(title: Text("Login")),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextInput(
                        controller: username,
                        keyboardType: TextInputType.number,
                        icon: Icon(Icons.person),
                        label: const Text("Username"),
                        validator: (String? value) {
                          if (value!.isNotEmpty ) return null;
                          return "Username cannot be empty";
                        },
                        onChanged: (String input) {
                          viewModel.add(UserNameInputEvent(input));
                        },
                      ),
                      const SizedBox(height: 15),
                      TextInput(
                        controller: password,
                        // initialValue: postBody,
                        icon: Icon(Icons.password),
                        label: const Text("Password"),
                        obscureText: true,
                        validator: (String? value) {
                            if (state.password.isValid) return null;
                            return "Password cannot be empty";
                        },
                        onChanged: (String input) {
                          viewModel.add(PasswordInputEvent(input));
                        },
                      ),

                      SizedBox(
                        width: width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              viewModel.add(LoginSubmittedEvent());
                            }
                          },
                          child: Text("Login".toCapital),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
            BlocBuilder<LoginPageBloc, LoginPageState>(
              builder: (context, state) {
                return state.submitStatus.isInProgress
                    ? const SpinKitIndicator(type: SpinKitType.circle)
                    : Container();
              },
            ),
            // BlocBuilder<LoginPageBloc, LoginPageState>(
            //   builder: (context, state) {
            //     return state.status.isError
            //         ? RetryDialog(
            //             title: 'username dan password salah',
            //             onCancelPressed: () => viewModel.add(LoginPageInitialEvent()) ,
            //             onRetryPressed: () =>
            //                 viewModel.add(LoginSubmittedEvent()))
            //         : Container();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
