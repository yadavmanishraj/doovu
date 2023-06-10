import 'package:doovu/auth/bloc/auth_bloc.dart';
import 'package:doovu/auth/services/auth_service.dart';
import 'package:doovu/data/dataproviders/task_category_provider.dart';
import 'package:doovu/data/dataproviders/task_provider.dart';
import 'package:doovu/domain/task_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:appwrite/appwrite.dart';

final locator = GetIt.instance;

void setUp() {
  Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6482bbc0717c99611a70')
      .setSelfSigned(status: true);

  locator.registerLazySingleton(() => AppWriteAuthService(client));
  locator.registerLazySingleton(
      () => AuthBloc(locator.get<AppWriteAuthService>()));
  locator.registerLazySingleton<TaskProvider>(() => TaskProvider(client));
  locator.registerLazySingleton(() => TaskCategoryProvider(client));
  locator.registerLazySingleton(() => TaskRepository(client));
}
