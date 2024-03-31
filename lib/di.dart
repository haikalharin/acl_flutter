import 'package:acl_flutter/core/network/dio_client.dart';
import 'package:acl_flutter/core/network/dio_client_new.dart';
import 'package:acl_flutter/data/remote_data_source/agent/get_agent_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/add_register_candidate_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/get_candidate_data_documents_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/get_candidate_family_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/pending_simple_checking.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/start_process_instance_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate_faa/add_education_candidate_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate_faa/add_families_data_candidate_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate_faa/add_register_candidate_private_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate_faa/add_work_eexperience_candidate_api.dart';
import 'package:acl_flutter/data/remote_data_source/comment/comment_api.dart';
import 'package:acl_flutter/data/remote_data_source/document/document_api.dart';
import 'package:acl_flutter/data/remote_data_source/master_data/master_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/notify/notify_api.dart';
import 'package:acl_flutter/data/remote_data_source/post/post_api.dart';
import 'package:acl_flutter/data/remote_data_source/spouse/sepouse_api.dart';
import 'package:acl_flutter/data/remote_data_source/todo/todo_api.dart';
import 'package:acl_flutter/data/remote_data_source/user/user_api.dart';
import 'package:acl_flutter/data/repository/agent/agent_repository.dart';
import 'package:acl_flutter/data/repository/candidate/candidate_repository.dart';
import 'package:acl_flutter/data/repository/candidate_faa/candidate_faa_repository.dart';
import 'package:acl_flutter/myApp.dart';
import 'package:acl_flutter/screens/add_candidate_page/bloc/add_candidate_page_bloc.dart';
import 'package:acl_flutter/screens/detail_candidate/bloc/detail_candidate_page_bloc.dart';
import 'package:acl_flutter/screens/faa_form_candidate/bloc/faa_candidate_page_bloc.dart';
import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:acl_flutter/screens/login_page/bloc/login_page_bloc.dart';
import 'package:acl_flutter/screens/sidebar_page/bloc/side_bar_page_bloc.dart';
import 'package:acl_flutter/screens/splashscreen_page/bloc/splash_screen_bloc.dart';
import 'package:acl_flutter/viewmodel/comment/bloc/comment_bloc.dart';
import 'package:acl_flutter/viewmodel/post/bloc/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/remote_data_source/candidate/candiate_be_api.dart';
import 'data/remote_data_source/candidate/candidate_api.dart';
import 'data/remote_data_source/candidate/get_candidate_data_api.dart';
import 'data/remote_data_source/candidate/tracking_candidate_api.dart';
import 'data/remote_data_source/login/login_api.dart';
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

  getIt.registerLazySingleton<Dio>(() => Dio(), instanceName: 'specialDio');

  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  getIt.registerLazySingleton<DioClientNew>(
      () => DioClientNew(getIt<Dio>(instanceName: 'specialDio')));

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
      () => AddRegisterCandidateApi(dioClient: getIt<DioClient>()));

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

  // StartProcessInstance api
  getIt.registerLazySingleton<StartProcessInstanceApi>(
      () => StartProcessInstanceApi(dioClient: getIt<DioClient>()));

  // AddWorkExperienceCandidate api
  getIt.registerLazySingleton<AddWorkExperienceCandidateApi>(
      () => AddWorkExperienceCandidateApi(dioClient: getIt<DioClient>()));

  // AddEducationeCandidate api
  getIt.registerLazySingleton<AddEducationCandidateApi>(
      () => AddEducationCandidateApi(dioClient: getIt<DioClient>()));

  // AgentData api
  getIt.registerLazySingleton<AgentDataApi>(
      () => AgentDataApi(dioClient: getIt<DioClient>()));

  // getCandidateDataDocument api
  getIt.registerLazySingleton<GetCandidateDataDocumentsApi>(
      () => GetCandidateDataDocumentsApi(dioClient: getIt<DioClient>()));

  // AddRegisterCandidatePrivateData api
  getIt.registerLazySingleton<AddRegisterCandidatePrivateDataApi>(
      () => AddRegisterCandidatePrivateDataApi(dioClient: getIt<DioClient>()));

  // AddRegisterCandidatePrivateData api
  getIt.registerLazySingleton<GetCandidateFamilyDataApi>(
          () => GetCandidateFamilyDataApi(dioClient: getIt<DioClient>()));

  // AddFamiliesData api
  getIt.registerLazySingleton<AddFamiliesDataCandidateApi>(
          () => AddFamiliesDataCandidateApi(dioClient: getIt<DioClient>()));


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

  //Login repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(loginApi: getIt<LoginApi>()),
  );



  // candidate repository
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
      pendingSimpleCheckingApi: getIt<PendingSimpleCheckingApi>(),
      startProcessInstanceApi: getIt<StartProcessInstanceApi>(),
      getCandidateDataDocumentsApi: getIt<GetCandidateDataDocumentsApi>(),
      getCandidateFamilyDataApi: getIt<GetCandidateFamilyDataApi>(),
    ),
  );

  // CandidateFaa repository
  getIt.registerLazySingleton<CandidateFaaRepository>(
    () => CandidateFaaRepository(
        addWorkExperienceCandidateApi: getIt<AddWorkExperienceCandidateApi>(),
        addEducationCandidateApi: getIt<AddEducationCandidateApi>(),
        addRegisterCandidatePrivateDataApi:
            getIt<AddRegisterCandidatePrivateDataApi>(),
      addFamiliesDataCandidateApi:
      getIt<AddFamiliesDataCandidateApi>(),
    ),
  );

  // Notfikasi repository
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepository(notifyApi: getIt<NotifyApi>()),
  );

  // Agent repository
  getIt.registerLazySingleton<AgentRepository>(
    () => AgentRepository(agentDataApi: getIt<AgentDataApi>()),
  );

  //Post Bloc
  getIt.registerLazySingleton(
      () => PostBloc(postRepository: getIt<PostRepository>()));

  //Comment Bloc
  getIt.registerLazySingleton(
      () => CommentBloc(commentRepository: getIt<CommentRepository>()));

  //Login Bloc
  getIt.registerLazySingleton(() => LoginPageBloc(
      loginRepository: getIt<LoginRepository>(),
      agentRepository: getIt<AgentRepository>()));

  //Home Bloc
  getIt.registerLazySingleton(() => HomePageBloc(
      candidateRepository: getIt<CandidateRepository>(),
      notificationRepository: getIt<NotificationRepository>(),
      agentRepository: getIt<AgentRepository>()));

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
      candidateRepository: getIt<CandidateRepository>(),
      candidateFaaRepository: getIt<CandidateFaaRepository>()));
}
