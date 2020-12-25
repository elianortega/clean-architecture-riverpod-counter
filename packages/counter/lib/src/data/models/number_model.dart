import 'package:meta/meta.dart';
import 'package:counter/src/domain/entities/number.dart';

///Number Model
class NumberModel extends Number {
  ///Number model constructor
  NumberModel({@required int value}) : super(value: value);

  /// Factory constructor from json
  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      value: int.parse(json['result']),
    );
  }

  /// Map constructor from model
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}
