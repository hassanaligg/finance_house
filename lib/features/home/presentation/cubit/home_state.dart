import 'package:finance_house/features/home/data/models/user_model.dart';

class HomeState {
  final HomeStatus status;
  final User? user;
  final String? errorMessage;

  final bool isBalanceVisible;
  final double blurXValue;
  final double blurYValue;

  HomeState({
    required this.status,
    this.user,
    this.errorMessage,
    required this.isBalanceVisible,
    required this.blurXValue,
    required this.blurYValue,
  });

  factory HomeState.initial() => HomeState(
    status: HomeStatus.initial,
    user: null,
    errorMessage: null,
    isBalanceVisible: false,
    blurXValue: 0.0,
    blurYValue: 0.0,
  );

  HomeState copyWith({
    HomeStatus? status,
    User? user,
    String? errorMessage,
    bool? isBalanceVisible,
    double? blurXValue,
    double? blurYValue,
  }) {
    return HomeState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible,
      blurXValue: blurXValue ?? this.blurXValue,
      blurYValue: blurYValue ?? this.blurYValue,
    );
  }
}
enum HomeStatus { initial, loading, loaded, error }

