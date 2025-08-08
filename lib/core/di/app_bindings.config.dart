// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:finance_house/common_widgets/loading_wrapper.dart' as _i270;
import 'package:finance_house/core/data/failure/parser/failure_parser.dart'
    as _i196;
import 'package:finance_house/core/di/dio_client.dart' as _i365;
import 'package:finance_house/core/di/failure_parser_module.dart' as _i1063;
import 'package:finance_house/features/home/data/datasources/remote_datasource/home_remote_data_source.dart'
    as _i873;
import 'package:finance_house/features/home/data/datasources/remote_datasource/home_remote_data_source_imp.dart'
    as _i737;
import 'package:finance_house/features/home/data/repositories/home_repository_imp.dart'
    as _i598;
import 'package:finance_house/features/home/domain/repositories/home_repository.dart'
    as _i46;
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart'
    as _i140;
import 'package:finance_house/features/manage_beneficiary/data/datasource/remote_datasource/add_benf_data_source.dart'
    as _i398;
import 'package:finance_house/features/manage_beneficiary/data/datasource/remote_datasource/add_benf_data_source_imp.dart'
    as _i812;
import 'package:finance_house/features/manage_beneficiary/data/repositories/add_benf_repository_imp.dart'
    as _i18;
import 'package:finance_house/features/manage_beneficiary/domain/repositories/add_benef_repository.dart'
    as _i304;
import 'package:finance_house/features/manage_beneficiary/presentation/cubit/add_benef_cubit.dart'
    as _i388;
import 'package:finance_house/features/transfer/data/datasource/remote_datasource/transfer_data_source.dart'
    as _i479;
import 'package:finance_house/features/transfer/data/datasource/remote_datasource/transfer_data_source_imp.dart'
    as _i33;
import 'package:finance_house/features/transfer/data/repositories/transfer_repository_imp.dart'
    as _i127;
import 'package:finance_house/features/transfer/domain/repositories/transfer_repository.dart'
    as _i1043;
import 'package:finance_house/features/transfer/presentation/cubit/transfer_cubit.dart'
    as _i61;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final dioModule = _$DioModule();
    final failureParserModule = _$FailureParserModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i196.FailureParser>(
        () => failureParserModule.provideFailureParser());
    gh.lazySingleton<_i270.LoadingCubit>(() => _i270.LoadingCubit());
    gh.factory<_i479.TransferDataSource>(() => _i33.TransferDataSourceImp(
          dio: gh<_i361.Dio>(),
          failureParser: gh<_i196.FailureParser>(),
        ));
    gh.factory<_i873.HomeRemoteDataSource>(() => _i737.HomeRemoteDataSourceImp(
          dio: gh<_i361.Dio>(),
          failureParser: gh<_i196.FailureParser>(),
        ));
    gh.factory<_i398.AddBeneficiaryDataSource>(
        () => _i812.AddBeneficiaryDataSourceImp(
              dio: gh<_i361.Dio>(),
              failureParser: gh<_i196.FailureParser>(),
            ));
    gh.factory<_i46.HomeRepository>(() => _i598.HomeRepositoryImp(
        remoteDataSource: gh<_i873.HomeRemoteDataSource>()));
    gh.factory<_i1043.TransferRepository>(() => _i127.TransferRepositoryImp(
        remoteDataSource: gh<_i479.TransferDataSource>()));
    gh.factory<_i304.AddBeneficiaryRepository>(() =>
        _i18.AddBeneficiaryRepositoryImp(
            remoteDataSource: gh<_i398.AddBeneficiaryDataSource>()));
    gh.factory<_i140.HomeCubit>(
        () => _i140.HomeCubit(gh<_i46.HomeRepository>()));
    gh.factory<_i388.AddBeneficiaryCubit>(
        () => _i388.AddBeneficiaryCubit(gh<_i304.AddBeneficiaryRepository>()));
    gh.factory<_i61.TransferCubit>(
        () => _i61.TransferCubit(gh<_i1043.TransferRepository>()));
    return this;
  }
}

class _$DioModule extends _i365.DioModule {}

class _$FailureParserModule extends _i1063.FailureParserModule {}
