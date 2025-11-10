import 'package:user_profile/application/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:user_profile/application/service/locator.dart';
import 'package:user_profile/infrastructure/data_source/remote_data_source.dart';
import 'package:user_profile/infrastructure/repository_impl/user_repository_impl.dart';

import '../../domain/repository/user_repository.dart';

/// Global access to service locator.
final LocatorImpl locator = LocatorImpl();

abstract interface class AppInjector {
  Future<void> init();
}

class DInjector implements AppInjector {
  @override
  Future<void> init() async {
    locator.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(),
    );
    locator.registerFactory<UserRepository>(
      () => UserRepositoryImpl(locator.get()),
    );
    locator.registerFactory(
      () => UserProfileCubit(repository: locator.get()),
    );
  }
}
