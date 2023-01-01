import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/features/favorites/data/datasource/base_favorite_remote_data_source.dart';
import 'package:shop_now/features/favorites/data/repository/favorites_repository.dart';
import 'package:shop_now/features/favorites/domain/repository/base_favorite_repository.dart';
import 'package:shop_now/features/favorites/domain/usecase/get_favorites_use_case.dart';
import 'package:shop_now/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:shop_now/features/home/data/repository/home_repository.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';
import 'package:shop_now/features/home/domain/usecase/get_categories_details_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_change_favorites_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_home_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_products_details_use_case.dart';
import 'package:shop_now/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:shop_now/features/login/data/repository/login_repository.dart';
import 'package:shop_now/features/login/domain/repository/base_login_repostiory.dart';
import 'package:shop_now/features/login/domain/usecase/get_login_user_use_case.dart';
import 'package:shop_now/features/login/presentation/controller/cubit/cubit.dart';
import 'package:shop_now/features/notification/data/datasource/base_notification_remote_data_source.dart';
import 'package:shop_now/features/notification/data/repository/notification_repository.dart';
import 'package:shop_now/features/notification/domain/repository/base_notification_repository.dart';
import 'package:shop_now/features/notification/domain/usecase/get_notification_use_case.dart';
import 'package:shop_now/features/register/data/datasource/base_register_remote_data_source.dart';
import 'package:shop_now/features/register/data/repository/register_repository.dart';
import 'package:shop_now/features/register/domain/repository/base_login_repository.dart';
import 'package:shop_now/features/register/domain/usecase/get_register_use_case.dart';
import 'package:shop_now/features/register/presentation/controller/cubit/cubit.dart';
import 'package:shop_now/features/settings/data/datasource/base_profile_remote_data_source.dart';
import 'package:shop_now/features/settings/data/repository/profile_repository.dart';
import 'package:shop_now/features/settings/domain/repository/base_profile_repository.dart';
import 'package:shop_now/features/settings/domain/usecase/get_profile_use_case.dart';
import 'package:shop_now/features/update_profile/data/datasource/base_update_profile_remote_data_source.dart';
import 'package:shop_now/features/update_profile/data/repository/update_profile_repository.dart';
import 'package:shop_now/features/update_profile/domain/repository/base_update_profile_repository.dart';
import 'package:shop_now/features/update_profile/domain/usecase/get_update_profile_use_case.dart';


final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    sl.registerFactory(
      () => HomeCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    // Notification //
    sl.registerLazySingleton(() => GetNotificationUseCase(sl()));
    sl.registerLazySingleton<BaseNotificationRepository>(
            () => NotificationRepository(sl()));
    sl.registerLazySingleton<BaseNotificationRemoteDataSource>(
            () => NotificationRemoteDataSource(sl()));
    // Update Profile //
    sl.registerLazySingleton(() => GetUpdateProfileUseCase(sl()));
    sl.registerLazySingleton<BaseUpdateProfileRepository>(
            () => UpdateProfileRepository(sl()));
    sl.registerLazySingleton<BaseUpdateProfileRemoteDataSource>(
            () => UpdateProfileRemoteDataSource(sl()));
    // Get Profile //
    sl.registerLazySingleton(() => GetProfileUseCase(sl()));
    sl.registerLazySingleton<BaseProfileRepository>(
            () => ProfileRepository(sl()));
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(
            () => ProfileRemoteDataSource(sl()));
    // Get Favorites//
    sl.registerLazySingleton(() => GetFavoritesUseCae(sl()));
    sl.registerLazySingleton<BaseFavoritesRepository>(
        () => FavoritesRepository(sl()));
    sl.registerLazySingleton<BaseFavoriteRemoteDataSource>(
        () => FavoriteRemoteDataSource(sl()));
    // Get Home //
    sl.registerLazySingleton(() => GetChangeFavoritesUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetProductsDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetHomeUseCase(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource(sl()));
    // register //
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerLazySingleton(() => GetRegisterUseCase(sl()));
    sl.registerLazySingleton<BaseRegisterRepository>(
        () => RegisterRepository(sl()));
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
        () => RegisterRemoteDataSource(sl()));
    //Login //
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerLazySingleton(() => GetLoginUserUseCase(sl()));
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource(sl()));

    //shared preferences //

    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
  }
}
