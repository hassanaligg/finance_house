import 'package:finance_house/common_widgets/loading_wrapper.dart';
import 'package:finance_house/features/manage_beneficiary/presentation/cubit/add_benef_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_house/core/di/app_bindings.dart';
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_house/features/transfer/presentation/cubit/transfer_cubit.dart';

List<BlocProvider> createProviders() {
  return [
     BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()),
     BlocProvider<TransferCubit>(create: (_) => getIt<TransferCubit>()),
     BlocProvider<LoadingCubit>(create: (_) => getIt<LoadingCubit>()),
     BlocProvider<AddBeneficiaryCubit>(create: (_) => getIt<AddBeneficiaryCubit>()),
  ];
}
