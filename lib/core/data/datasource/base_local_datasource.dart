import 'package:hive/hive.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_house/core/data/failure/local_storage/local_storage_failure.dart';
import 'package:finance_house/core/data/failure/parser/failure_parser.dart';

abstract class BaseLocalDataSource {
  Future<Either<String, T?>> read<T>({
    required String key,
  });

  Future<Either<String, bool>> write<T>({
    required String key,
    required T value,
  });

  Future<Either<String, bool>> delete({required String key});

  Future<Either<String, bool>> clearBox();
}


class BaseLocalDataSourceImp extends BaseLocalDataSource {
  final String hiveBoxName;
  late Box _hiveBox;
  final FailureParser failureParser;

  BaseLocalDataSourceImp(
      {required this.hiveBoxName, required this.failureParser});

  Future<void> init() async {
    _hiveBox = await Hive.openBox(hiveBoxName);
  }

  Future<void> dispose() async {
    if (_hiveBox.isOpen) {
      await _hiveBox.close();
    }
  }

  Future<Either<String, T>> _handleError<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } catch (e) {
      return Left(failureParser
          .mapFailureToString(OperationFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<String, T>> read<T>({
    required String key,
  }) async {
    final value = _hiveBox.get(key);
    if (value == null) {
      return Left(failureParser.mapFailureToString(DataNotExistFailure()));
    }
    if (value is! T) {
      return Left(failureParser.mapFailureToString(BadDataFailure()));
    }
    return Right(value);
  }

  @override
  Future<Either<String, bool>> write<T>({
    required String key,
    required T value,
  }) async {
    return await _handleError(() async {
      await _hiveBox.put(key, value);
      return true;
    });
  }

  @override
  Future<Either<String, bool>> delete({required String key}) async {
    return await _handleError(() async {
      await _hiveBox.delete(key);
      return true;
    });
  }

  @override
  Future<Either<String, bool>> clearBox() async {
    return await _handleError(() async {
      await _hiveBox.clear();
      return true;
    });
  }
}
