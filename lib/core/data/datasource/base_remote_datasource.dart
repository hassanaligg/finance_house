import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:finance_house/core/data/failure/base/base_failure.dart';
import 'package:finance_house/core/data/failure/http/http_failure.dart';
import 'package:finance_house/core/data/failure/parser/failure_parser.dart';
import 'package:finance_house/core/data/model/base_response_model.dart';
import 'package:finance_house/core/types/typedefs.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<EitherResponse<T>> post<T>(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers,
      required T Function(dynamic) decoder,
      bool requiredToken = true});

  @protected
  Future<Either<String, T>> myPost<T>(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers,
      required T Function(dynamic) decoder,
      bool requiredToken = true});

  @protected
  Future<Either<String, BaseResponse<T>>> postImage<T>(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      required T Function(dynamic) decoder,
      bool requiredToken = true});

  @protected
  Future<Either<String, BaseResponse<T>>> get<T>(
      {required String url,
      Map<String, dynamic>? params,
      required T Function(dynamic) decoder,
      bool requiredToken = true});

  @protected
  Future<Either<String, BaseResponse<T>>> delete<T>(
      {required String url,
      Map<String, dynamic>? params,
      required T Function(dynamic) decoder,
      bool requiredToken = true});

  @protected
  Future<Either<String, BaseResponse<T>>> put<T>(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      required T Function(dynamic p1) decoder,
      bool requiredToken = true});

  @protected
  Future<Either<String, BaseResponse<T>>> putForm<T>(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      required T Function(dynamic p1) decoder,
      bool requiredToken = true});
}

class BaseRemoteDataSourceImpl implements BaseRemoteDataSource {
  final Dio dio;
  final FailureParser failureParser;

  BaseRemoteDataSourceImpl({required this.dio, required this.failureParser});

  Future<Either<String, T>> handleApiCall<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic) decoder,
  ) async {
    try {
      final response = await apiCall();
      final decodedData = decoder(response.data);
      return Right(decodedData);
    } on DioException catch (e) {
      print("Error $e");
      final failure = mapDioExceptionToFailure(e);
      final failureMessage = failureParser.mapFailureToString(failure);
      return Left(failureMessage);
    } catch (e) {
      print("Error $e");
      final failureMessage =
          failureParser.mapFailureToString(const UnknownFailure());
      return Left(failureMessage);
    }
  }

  Failure mapDioExceptionToFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeOutFailure();
      case DioExceptionType.badResponse:
        int statusCode = e.response?.statusCode ?? -1;

        if (statusCode == 403 || statusCode == 401) {
          return CustomFailure(
              message: e.response?.data['message'] ?? "Authorization failed");
        } else if (statusCode == 400 || statusCode == 404) {
          return CustomFailure(
              message: e.response?.data['message'] ?? "Request failed");
        } else if (statusCode >= 500) {
          return const ServerFailure();
        }
        return const UnexpectedResponseFailure();

      case DioExceptionType.connectionError:
        return const NoInternetFailure();
      case DioExceptionType.cancel:
        return const CancelRequestFailure();
      default:
        return const UnknownFailure();
    }
  }

  @override
  Future<Either<String, BaseResponse<T>>> delete<T>({
    required String url,
    Map<String, dynamic>? params,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    return await handleApiCall<BaseResponse<T>>(
      () => dio.delete(url, queryParameters: params),
      (data) => BaseResponse.fromJson(data: data, decoder: decoder),
    );
  }

  @override
  Future<Either<String, BaseResponse<T>>> get<T>({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    if (requiredToken) {
      dio.options.headers.addAll({"requiredToken": true});
    }

    return await handleApiCall<BaseResponse<T>>(
      () => dio.get(url, queryParameters: params, data: body),
      (data) => BaseResponse.fromJson(data: data, decoder: decoder),
    );
  }

  @override
  Future<EitherResponse<T>> post<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    return await handleApiCall<BaseResponse<T>>(
      () => dio.post(
        url,
        queryParameters: params,
        data: body,
        options: Options(headers: headers),
      ),
      (data) => BaseResponse.fromJson(data: data, decoder: decoder),
    );
  }

  @override
  Future<Either<String, T>> myPost<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    return await handleApiCall<T>(
      () => dio.post(url,
          queryParameters: params,
          data: body,
          options: Options(headers: headers)),
      (data) => decoder(data),
    );
  }

  @override
  Future<Either<String, BaseResponse<T>>> postImage<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    return await handleApiCall<BaseResponse<T>>(
      () => dio.post(url,
          queryParameters: params, data: FormData.fromMap(body ?? {})),
      (data) => BaseResponse.fromJson(data: data, decoder: decoder),
    );
  }

  @override
  Future<Either<String, BaseResponse<T>>> put<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    return await handleApiCall<BaseResponse<T>>(
      () => dio.put(url, queryParameters: params, data: body),
      (data) => BaseResponse.fromJson(data: data, decoder: decoder),
    );
  }

  @override
  Future<Either<String, BaseResponse<T>>> putForm<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    required T Function(dynamic) decoder,
    bool requiredToken = true,
  }) async {
    return await handleApiCall<BaseResponse<T>>(
      () => dio.put(url,
          queryParameters: params, data: FormData.fromMap(body ?? {})),
      (data) => BaseResponse.fromJson(data: data, decoder: decoder),
    );
  }
}
