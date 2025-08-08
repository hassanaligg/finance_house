
import 'package:json_annotation/json_annotation.dart';

part 'user_summary.g.dart';

@JsonSerializable()
class UserSummary {
  final String name;
  final String id;

  UserSummary({
    required this.name,
    required this.id,
  });

  factory UserSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$UserSummaryToJson(this);
}
