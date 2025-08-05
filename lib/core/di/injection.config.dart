// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/loan/data/datasource/loan_datasource.dart' as _i293;
import '../../feature/loan/data/repositories/loan_repository_impl.dart'
    as _i880;
import '../../feature/loan/domain/bloc/loan_bloc.dart' as _i821;
import '../../feature/loan/domain/controller/loan_controller.dart' as _i873;
import '../../feature/loan/domain/repositories/loan_repository.dart' as _i616;
import '../../feature/login/data/datasource/auth_datasource.dart' as _i357;
import '../../feature/login/data/repositories/auth_repository_impl.dart'
    as _i357;
import '../../feature/login/domain/bloc/auth_bloc.dart' as _i1002;
import '../../feature/login/domain/controller/auth_controller.dart' as _i498;
import '../../feature/login/domain/repositories/auth_repository.dart' as _i557;
import '../database/local_database.dart' as _i391;
import '../routes/app_router.dart' as _i629;
import '../shared/storage_preferences.dart' as _i354;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i629.AppRouter>(() => _i629.AppRouter());
    gh.lazySingleton<_i391.LocalDataSource>(() => _i391.LocalDataSource());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.lazySingleton<_i873.LoanController>(() => _i873.LoanController());
    gh.lazySingleton<_i354.StoragePreferences>(() => _i354.StoragePreferences(
        flutterStorage: gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i498.AuthController>(() => _i498.AuthController(
        storagePreferences: gh<_i354.StoragePreferences>()));
    gh.lazySingleton<_i354.IFlutterStorage>(() =>
        registerModule.bindSecureStorage(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i293.ILoanDataSource>(() =>
        _i293.LoanDataSourceImpl(localDataSource: gh<_i391.LocalDataSource>()));
    gh.lazySingleton<_i357.IAuthDataSource>(() =>
        _i357.AuthDataSourceImpl(localDataSource: gh<_i391.LocalDataSource>()));
    gh.lazySingleton<_i557.IAuthRepository>(() => _i357.AuthRepositoryImpl(
          dataSource: gh<_i357.IAuthDataSource>(),
          storage: gh<_i354.IFlutterStorage>(),
        ));
    gh.lazySingleton<_i616.ILoanRepository>(() =>
        _i880.LoanRepositoryImpl(dataSource: gh<_i293.ILoanDataSource>()));
    gh.factory<_i821.LoanBloc>(() => _i821.LoanBloc(
          repository: gh<_i616.ILoanRepository>(),
          controller: gh<_i873.LoanController>(),
        ));
    gh.factory<_i1002.AuthBloc>(
        () => _i1002.AuthBloc(repository: gh<_i557.IAuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
