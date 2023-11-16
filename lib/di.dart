import 'package:acl_flutter/core/network/dio_client.dart';
import 'package:acl_flutter/data/api/agent/agent_api.dart';
import 'package:acl_flutter/data/api/agent/agent_be_api.dart';
import 'package:acl_flutter/data/api/comment/comment_api.dart';
import 'package:acl_flutter/data/api/notify/notify_api.dart';
import 'package:acl_flutter/data/api/post/post_api.dart';
import 'package:acl_flutter/data/api/todo/todo_api.dart';
import 'package:acl_flutter/data/api/user/user_api.dart';
import 'package:acl_flutter/myApp.dart';
import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:acl_flutter/screens/login_page/bloc/login_page_bloc.dart';
import 'package:acl_flutter/screens/sidebar_page/bloc/side_bar_page_bloc.dart';
import 'package:acl_flutter/screens/splashscreen_page/bloc/splash_screen_bloc.dart';
import 'package:acl_flutter/screens/todo/bloc/todo_bloc.dart';
import 'package:acl_flutter/screens/user/bloc/user_bloc.dart';
import 'package:acl_flutter/viewmodel/comment/bloc/comment_bloc.dart';
import 'package:acl_flutter/viewmodel/post/bloc/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/api/login/login_api.dart';
import 'data/repository/agent/agent_repository.dart';
import 'data/repository/comment/comment_repository.dart';
import 'data/repository/login/login_repository.dart';
import 'data/repository/notification/notification_repository.dart';
import 'data/repository/post/post_repository.dart';
import 'data/repository/todo/todo_repository.dart';
import 'data/repository/user/user_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<DioClient>(
      () => DioClient(getIt<Dio>(), getIt<Dio>()));

  // User api
  getIt.registerLazySingleton<UserApi>(
      () => UserApi(dioClient: getIt<DioClient>()));

  // _Todo api
  getIt.registerLazySingleton<ToDoApi>(
      () => ToDoApi(dioClient: getIt<DioClient>()));

  // Post api
  getIt.registerLazySingleton<PostApi>(
      () => PostApi(dioClient: getIt<DioClient>()));

  // Comment api
  getIt.registerLazySingleton<CommentApi>(
      () => CommentApi(dioClient: getIt<DioClient>()));

  // Login api
  getIt.registerLazySingleton<LoginApi>(
      () => LoginApi(dioClient: getIt<DioClient>()));

  // Agent api
  getIt.registerLazySingleton<AgentApi>(
      () => AgentApi(dioClient: getIt<DioClient>()));

  // Notify api
  getIt.registerLazySingleton<NotifyApi>(
      () => NotifyApi(dioClient: getIt<DioClient>()));

  // Agent api
  getIt.registerLazySingleton<AgentBeApi>(
          () => AgentBeApi(dioClient: getIt<DioClient>()));

  // User repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(userApi: getIt<UserApi>()),
  );

// _Todo repository
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepository(todoApi: getIt<ToDoApi>()),
  );

  // Post repository
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepository(postApi: getIt<PostApi>()),
  );
  // Comment repository
  getIt.registerLazySingleton<CommentRepository>(
    () => CommentRepository(commentApi: getIt<CommentApi>()),
  );

  // Login repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(loginApi: getIt<LoginApi>()),
  );

  // Agent repository
  getIt.registerLazySingleton<AgentRepository>(
    () => AgentRepository(agentApi: getIt<AgentApi>(), agentBeApi: getIt<AgentBeApi>()),
  );

  // Agent repository
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepository(notifyApi: getIt<NotifyApi>()),
  );

  //_Todo Bloc
  getIt.registerLazySingleton(
      () => TodoBloc(todoRepository: getIt<TodoRepository>()));

  //Post Bloc
  getIt.registerLazySingleton(
      () => PostBloc(postRepository: getIt<PostRepository>()));

  //Comment Bloc
  getIt.registerLazySingleton(
      () => CommentBloc(commentRepository: getIt<CommentRepository>()));

  //User Bloc
  getIt.registerLazySingleton(
      () => UserBloc(userRepository: getIt<UserRepository>()));

  //Login Bloc
  getIt.registerLazySingleton(
      () => LoginPageBloc(loginRepository: getIt<LoginRepository>()));

  //Home Bloc
  getIt.registerLazySingleton(() => HomePageBloc(
      agentRepository: getIt<AgentRepository>(),
      notificationRepository: getIt<NotificationRepository>()));

  //Splashscreen Bloc
  getIt.registerLazySingleton(() => SplashscreenBloc());

  //SideBar Bloc
  getIt.registerLazySingleton(() => SideBarPageBloc());

  //Language Cubit
  getIt.registerLazySingleton(() => LanguageCubit());
}
