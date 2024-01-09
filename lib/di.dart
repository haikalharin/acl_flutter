import 'package:acl_flutter/core/network/dio_client.dart';
import 'package:acl_flutter/core/network/dio_client_new.dart';
import 'package:acl_flutter/data/api/candidate/add_register_candidate_api.dart';
import 'package:acl_flutter/data/api/candidate/pending_simple_checking.dart';
import 'package:acl_flutter/data/api/comment/comment_api.dart';
import 'package:acl_flutter/data/api/document/document_api.dart';
import 'package:acl_flutter/data/api/master_data/master_data_api.dart';
import 'package:acl_flutter/data/api/notify/notify_api.dart';
import 'package:acl_flutter/data/api/post/post_api.dart';
import 'package:acl_flutter/data/api/spouse/sepouse_api.dart';
import 'package:acl_flutter/data/api/todo/todo_api.dart';
import 'package:acl_flutter/data/api/user/user_api.dart';
import 'package:acl_flutter/data/repository/candidate/candidate_repository.dart';
import 'package:acl_flutter/myApp.dart';
import 'package:acl_flutter/screens/add_candidate_page/bloc/add_candidate_page_bloc.dart';
import 'package:acl_flutter/screens/detail_candidate/bloc/detail_candidate_page_bloc.dart';
import 'package:acl_flutter/screens/faa_form_candidate/bloc/faa_candidate_page_bloc.dart';
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

import 'data/api/candidate/candiate_be_api.dart';
import 'data/api/candidate/candidate_api.dart';
import 'data/api/candidate/get_candidate_data_api.dart';
import 'data/api/candidate/tracking_candidate_api.dart';
import 'data/api/login/login_api.dart';
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

  getIt.registerLazySingleton<Dio>(() => Dio(),instanceName: 'specialDio');

  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  getIt.registerLazySingleton<DioClientNew>(() => DioClientNew(getIt<Dio>(instanceName: 'specialDio')));

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
      () => LoginApi(dioClient: getIt<DioClientNew>()));

  // Candidate api
  getIt.registerLazySingleton<CandidateApi>(
      () => CandidateApi(dioClient: getIt<DioClient>()));

  // Notify api
  getIt.registerLazySingleton<NotifyApi>(
      () => NotifyApi(dioClient: getIt<DioClient>()));

  // Agent api
  getIt.registerLazySingleton<CandidateBeApi>(
      () => CandidateBeApi(dioClient: getIt<DioClient>()));

  // MasterData api
  getIt.registerLazySingleton<MasterDataApi>(
      () => MasterDataApi(dioClient: getIt<DioClient>()));

  // Tracking api
  getIt.registerLazySingleton<TrackingCandidateApi>(
      () => TrackingCandidateApi(dioClient: getIt<DioClient>()));

  // AddRegisterCandidate api
  getIt.registerLazySingleton<AddRegisterCandidateApi>(
      () => AddRegisterCandidateApi(dioClient: getIt<DioClientNew>()));

  // AddRegisterSepouse api
  getIt.registerLazySingleton<AddRegisterSepouseApi>(
      () => AddRegisterSepouseApi(dioClient: getIt<DioClient>()));
// Document api
  getIt.registerLazySingleton<DocumentApi>(
      () => DocumentApi(dioClient: getIt<DioClient>()));

  // PendingSimpleChecking api
  getIt.registerLazySingleton<PendingSimpleCheckingApi>(
      () => PendingSimpleCheckingApi(dioClient: getIt<DioClient>()));

  // GetCandidateData api
  getIt.registerLazySingleton<GetCandidateDataApi>(
          () => GetCandidateDataApi(dioClient: getIt<DioClient>()));

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
  getIt.registerLazySingleton<CandidateRepository>(
    () => CandidateRepository(
        candidateApi: getIt<CandidateApi>(),
        candidateBeApi: getIt<CandidateBeApi>(),
        masterDataApi: getIt<MasterDataApi>(),
        trackingCandidateApi: getIt<TrackingCandidateApi>(),
        addRegisterCandidateApi: getIt<AddRegisterCandidateApi>(),
        documentApi: getIt<DocumentApi>(),
        addRegisterSepouseApi: getIt<AddRegisterSepouseApi>(),
        getCandidateDataApi: getIt<GetCandidateDataApi>(),
        pendingSimpleCheckingApi: getIt<PendingSimpleCheckingApi>()),
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
      agentRepository: getIt<CandidateRepository>(),
      notificationRepository: getIt<NotificationRepository>()));

  //Splashscreen Bloc
  getIt.registerLazySingleton(() => SplashscreenBloc());

  //SideBar Bloc
  getIt.registerLazySingleton(() => SideBarPageBloc());

  //Language Cubit
  getIt.registerLazySingleton(() => LanguageCubit());

  //add candidate Bloc
  getIt.registerLazySingleton(() =>
      AddCandidatePageBloc(candidateRepository: getIt<CandidateRepository>()));

  //detail candidate Bloc
  getIt.registerLazySingleton(() => DetailCandidatePageBloc(
      candidateRepository: getIt<CandidateRepository>()));

  //faa candidate Bloc
  getIt.registerLazySingleton(() => FaaCandidatePageBloc(
      candidateRepository: getIt<CandidateRepository>()));
}
