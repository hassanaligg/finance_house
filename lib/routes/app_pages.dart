import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/domain/entitites/user_data.dart';
import 'package:finance_house/features/manage_beneficiary/presentation/pages/add_beneficiary_page.dart';
import 'package:go_router/go_router.dart';
import 'package:finance_house/features/home/presentation/pages/home_screen.dart';
import 'package:finance_house/features/transfer/presentation/pages/transfer_screen.dart';
import 'package:finance_house/routes/app_routes.dart';

final GoRouter route = GoRouter(routes: [
  GoRoute(
    path: AppRoutes.homePath,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: AppRoutes.transfer,
    builder: (context, state) {
      final userdata = state.extra as UserData;
      return TransferScreen(userdata);
    },
  ),
  GoRoute(
    path: AppRoutes.addBeneficiary,
    builder: (context, state) {
      final user = state.extra as User;
      return AddBeneficiaryPage(
        userModel: user,
      );
    },
  ),
]);
