import 'package:dartz/dartz.dart';

import '../data/model/base_response_model.dart';


typedef EitherResponse<T> = Either<String, BaseResponse<T>>;
