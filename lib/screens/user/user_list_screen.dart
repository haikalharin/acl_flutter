import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/common/app_style.dart';
import 'package:acl_flutter/core/dialog/retry_dialog.dart';
import 'package:acl_flutter/core/widget/empty_widget.dart';
import 'package:acl_flutter/core/widget/popup_menu.dart';
import 'package:acl_flutter/core/widget/spinkit_indicator.dart';
import 'package:acl_flutter/core/widget/stateful_wrapper.dart';
import 'package:acl_flutter/data/model/user/user.dart';
import 'package:acl_flutter/di.dart';
import 'package:acl_flutter/screens/post/screen/post_list_screen.dart';
import 'package:acl_flutter/screens/todo/todo_list_screen.dart';
import 'package:acl_flutter/screens/user/bloc/user_event.dart';
import 'package:acl_flutter/screens/user/bloc/user_state.dart';
import 'package:acl_flutter/screens/user/widget/fab_user_list.dart';
import 'package:acl_flutter/screens/user/widget/status_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/user/user_repository.dart';
import 'bloc/user_bloc.dart';

enum Operation { edit, delete, post, todo }

class UserListScreen extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => UserBloc(
        userRepository: getIt<UserRepository>(),
      ),
      child: const UserListScreen(),
    );
  }

  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  Widget userListItem(User user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Row(
          children: [
            Image.asset(user.gender.name.getGenderWidget, height: 75),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(user.name, style: headLine4), const SizedBox(height: 10), Text(user.email, style: headLine6)],
              ),
            ),
            const SizedBox(width: 15),
            StatusContainer(status: user.status),
            PopupMenu<Operation>(
              items: Operation.values,
              onChanged: (Operation value) async {
                switch (value) {
                  case Operation.post:
                    navigateTo(PostListScreen(user: user));
                    break;
                  case Operation.todo:
                    navigateTo(ToDoListScreen(user: user));
                    break;
                  case Operation.delete:
                    // deleteUser(user);
                    break;
                  case Operation.edit:
                  // editUser(user);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // void deleteUser(User user) async {
  //   bool isAccepted = await deleteDialog(context);
  //   if (isAccepted) {
  //     if (!mounted) return;
  //     context.read<UserBloc>().add(UserDeleted(user));
  //     showDialog(
  //       context: context,
  //       builder: (_) {
  //         return BlocBuilder<UserBloc, GenericBlocState<User>>(
  //           builder: (BuildContext context, GenericBlocState<User> state) {
  //             switch (state.status) {
  //               case Status.empty:
  //                 return const SizedBox();
  //               case Status.loading:
  //                 return const ProgressDialog(
  //                   title: "Deleting user...",
  //                   isProgressed: true,
  //                 );
  //               case Status.failure:
  //                 return RetryDialog(
  //                   title: state.error ?? "Error",
  //                   onRetryPressed: () => context.read<UserBloc>().add(UserDeleted(user)),
  //                 );
  //               case Status.success:
  //                 return ProgressDialog(
  //                   title: "Successfully deleted",
  //                   onPressed: () {
  //                     context.read<UserBloc>().add(UsersFetched());
  //                     Navigator.pop(context);
  //                   },
  //                   isProgressed: false,
  //                 );
  //             }
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  // void editUser(User user) async {
  //   late User userObj;
  //   bool isUpdate = await createDialog(
  //     user: user,
  //     type: Type.update,
  //     context: context,
  //     userData: (User userValue) {
  //       userObj = userValue;
  //     },
  //   );

  //   if (isUpdate) {
  //     if (!mounted) return;
  //     context.read<UserBloc>().add(UserUpdated(userObj));
  //     showDialog(
  //       context: context,
  //       builder: (_) {
  //         return BlocBuilder<UserBloc, GenericBlocState<User>>(
  //           builder: (BuildContext context, GenericBlocState<User> state) {
  //             switch (state.status) {
  //               case Status.empty:
  //                 return const SizedBox();
  //               case Status.loading:
  //                 return const ProgressDialog(
  //                   title: "Updating user...",
  //                   isProgressed: true,
  //                 );
  //               case Status.failure:
  //                 return RetryDialog(
  //                   title: state.error ?? "Error",
  //                   onRetryPressed: () => context.read<UserBloc>().add(UserUpdated(userObj)),
  //                 );
  //               case Status.success:
  //                 return ProgressDialog(
  //                   title: "Successfully updated",
  //                   onPressed: () {
  //                     context.read<UserBloc>().add(UsersFetched());
  //                     Navigator.pop(context);
  //                   },
  //                   isProgressed: false,
  //                 );
  //             }
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  void navigateTo(Widget screen) {
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserBloc>();
    return StatefulWrapper(
      onInit: () => viewModel.add(UsersFetched()),
      child: Scaffold(
        floatingActionButton: FabUserList(onAddUser: (user) => viewModel.add(UserCreated(user))),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => viewModel.add(UsersFetched()),
            icon: const Icon(Icons.refresh),
          ),
          actions: [
            PopupMenu<UserStatus>(
              icon: Icons.filter_list_outlined,
              items: UserStatus.values,
              onChanged: (status) => viewModel.add(UsersFetched(status: status)),
            ),
            PopupMenu<Gender>(
              icon: Icons.filter_alt_outlined,
              items: Gender.values,
              onChanged: (gender) => viewModel.add(UsersFetched(gender: gender)),
            )
          ],
          title: const Text("Users"),
        ),
        body: BlocListener<UserBloc, UserState>(
  listener: (context, state) {
    // TODO: implement listener}
  },
  child: BlocBuilder<UserBloc, UserState>(
            // buildWhen: (prevState, curState) {
            //   return context.read<UserBloc>().operation == ApiOperation.select ? true : false;
            // },
            builder: (BuildContext context, UserState state) => state.when(
                  empty: (_, __, ___, ____) => const EmptyWidget(message: "No user!"),
                  loading: (_, __, ___, ____) => const SpinKitIndicator(type: SpinKitType.circle),
                  loaded: (data, _, __, ___) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: data?.length,
                    itemBuilder: (_, index) {
                      User user = data![index];
                      return userListItem(user);
                    },
                  ),
                  failure: (_, __, ___, error) => RetryDialog(title: error ?? '', onCancelPressed: () => viewModel.add(UsersFetched())),
                )),
),
      ),
    );
  }
}
