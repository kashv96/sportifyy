// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Providers/game_provider.dart' as _i3;
import 'Providers/user_provider.dart' as _i8;
import 'Repositories/impl/user_repository_impl.dart' as _i5;
import 'Repositories/user_repository.dart' as _i4;
import 'Services/impl/user_service_impl.dart' as _i7;
import 'Services/user_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.GameProvider>(() => _i3.GameProvider());
  gh.lazySingleton<_i4.UserRepository>(() => _i5.UserRepositoryImpl());
  gh.lazySingleton<_i6.UserService>(
      () => _i7.UserServiceImpl(get<_i4.UserRepository>()));
  gh.lazySingleton<_i8.UserProvider>(
      () => _i8.UserProvider(get<_i6.UserService>()));
  return get;
}
