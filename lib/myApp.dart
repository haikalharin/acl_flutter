import 'package:acl_flutter/screens/login_page/bloc/login_page_bloc.dart';
import 'package:acl_flutter/screens/todo/bloc/todo_bloc.dart';
import 'package:acl_flutter/screens/user/bloc/user_bloc.dart';
import 'package:acl_flutter/viewmodel/comment/bloc/comment_bloc.dart';
import 'package:acl_flutter/viewmodel/post/bloc/post_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/router/routes.dart';
import 'di.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(create: (context) => getIt<TodoBloc>()),
        BlocProvider<PostBloc>(create: (context) => getIt<PostBloc>()),
        BlocProvider<CommentBloc>(create: (context) => getIt<CommentBloc>()),
        BlocProvider<UserBloc>(create: (context) => getIt<UserBloc>()),
        BlocProvider<LoginPageBloc>(create: (context) => getIt<LoginPageBloc>()),
      ],
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        theme: AppTheme.lightAppTheme,
        navigatorKey: AppRouter.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.initialPage,
      ),
    );
  }
}
