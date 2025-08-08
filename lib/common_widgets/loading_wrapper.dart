import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_house/common_widgets/progress_bar.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget child;

  const LoadingWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, isLoading) {
        return Stack(
          children: [
            child,
            isLoading ? const  ProgressBar() :  const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}

@lazySingleton
class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void showLoading() => emit(true);
  void hideLoading() => emit(false);
}
