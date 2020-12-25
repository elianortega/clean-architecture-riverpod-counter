import 'package:dio/dio.dart';

import 'package:errors/errors.dart';
import 'package:counter/src/data/models/number_model.dart';

/// NumberRemote data source
abstract class NumberRemoteDataSource {
  /// increment counter funciton
  Future<NumberModel> incrementCounter(int number);
}

/// Number
class INumberRemoteDataSource implements NumberRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<NumberModel> incrementCounter(int number) async {
    return await _incrementCounterFromApi('$number + 1');
  }

  Future<NumberModel> _incrementCounterFromApi(String operation) async {
    final response = await _dio.post(
      'https://api.mathjs.org/v4/',
      options: RequestOptions(
        headers: {'Content-Type': 'application/json'},
      ),
      data: {'expr': operation},
    );

    if (response.statusCode == 200) {
      final number = NumberModel.fromJson(
        response.data,
      );
      return number;
    } else {
      throw ServerException();
    }
  }
}
